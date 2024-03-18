import React from "react";
import copy from "src/assets/icons/copy.svg";

interface CopyToClipboardButtonProps {
  text: string;
}

const CopyToClipboardButton: React.FC<CopyToClipboardButtonProps> = ({
  text,
}) => {
  const copyToClipboard = () => {
    if (text) {
      navigator.clipboard.writeText(text);
    }
  };

  return (
    <>
      <span>
        <img
          src={copy}
          alt="copy"
          onClick={copyToClipboard}
          style={{ cursor: "pointer" }}
        />
        {text}
      </span>
    </>
  );
};

export default CopyToClipboardButton;
