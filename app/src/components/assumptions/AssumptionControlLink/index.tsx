/** *******************************************************************************************************************
  Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.

  Licensed under the Apache License, Version 2.0 (the "License").
  You may not use this file except in compliance with the License.
  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
 ******************************************************************************************************************** */

import { FC, useCallback, useEffect, useState } from 'react';
import { useAssumptionLinksContext } from '../../../contexts/AssumptionLinksContext/context';
import { useControlsContext } from '../../../contexts/ControlsContext/context';
import { AssumptionLink } from '../../../customTypes';
import ControlLinkView from '../../controls/ControlLinkView';

export interface AssumptionThreatLinkProps {
  assumptionId: string;
}

const AssumptionThreatLinkComponent: FC<AssumptionThreatLinkProps> = ({
  assumptionId,
}) => {
  const { controlList, saveControl } = useControlsContext();
  const [assumptionLinks, setAssumptionLinks] = useState<AssumptionLink[]>([]);

  const { getAssumptionEntityLinks } = useAssumptionLinksContext();

  useEffect(() => {
    const _assumptionLinks = getAssumptionEntityLinks(assumptionId, 'Control');
    setAssumptionLinks(_assumptionLinks || []);
  }, [getAssumptionEntityLinks, assumptionId]);

  const {
    addAssumptionLink,
    removeAssumptionLink,
  } = useAssumptionLinksContext();

  const handleAddControlLink = useCallback((controlIdOrNewControl: string) => {
    if (controlList.find(m => m.id === controlIdOrNewControl)) {
      addAssumptionLink({
        linkedId: controlIdOrNewControl,
        assumptionId,
        type: 'Control',
      });
    } else {
      const newControl = saveControl({
        numericId: -1,
        content: controlIdOrNewControl,
        id: 'new',
      });
      addAssumptionLink({
        type: 'Control',
        linkedId: newControl.id,
        assumptionId,
      });
    }
  }, [assumptionId, controlList, addAssumptionLink, saveControl]);

  return (<ControlLinkView
    controlList={controlList}
    linkedControlIds={assumptionLinks.map(ml => ml.linkedId)}
    onAddControlLink={handleAddControlLink}
    onRemoveControlLink={(controlId) => removeAssumptionLink(assumptionId, controlId)}
  />);
};

export default AssumptionThreatLinkComponent;