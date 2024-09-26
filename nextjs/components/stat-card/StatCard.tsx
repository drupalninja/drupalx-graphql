import React from 'react';
import { Card, CardContent, CardTitle } from "@/components/ui/card";

export interface StatCardProps {
  type: 'stat';
  media?: React.ReactNode;
  heading: string;
  body?: string;
  icon: string;
  modifier?: string;
  layout?: 'left' | 'center';
}

const StatCard: React.FC<StatCardProps> = ({
  media,
  heading,
  body,
  icon,
  modifier = '',
  layout = 'center'
}) => {
  const alignmentClass = layout === 'left' ? 'text-left' : 'text-center';
  const iconClass = layout === 'left' ? 'mr-auto' : 'mx-auto';

  return (
    <Card className={`stat ${alignmentClass} ${modifier}`}>
      <CardContent className="pt-6">
        {icon && (
          <div className={`stat-icon ${iconClass} mb-4 max-w-[200px]`}>
            <span className="material-symbols-outlined">{icon}</span>
          </div>
        )}
        {media && (
          <div className={`stat-icon ${iconClass} mb-4 max-w-[200px]`}>
            {media}
          </div>
        )}
        <CardTitle className="mb-2">{heading}</CardTitle>
        {body && <p className="mb-0 text-gray-600">{body}</p>}
      </CardContent>
    </Card>
  );
};

export default StatCard;