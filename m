Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795561358;
	b=nwSmn3MseacZ8v1T+nZL6wR3rMyZJaTMCi0lykWpCb/AKBbfLFKaD1++o1rx5mF3iqhR
	 mC6GCuIy/KK+IK3a0BhgD02fzpRPrQP6u+UpItCB6I6HUmnN1FwLK4X0xBJ5i7uS1s0Dd
	 z+jAItvP69A6uCZDg/mhX88zZXsiFuAETE5yMepgKijmLzfnIP2aL7xHAJAfvqX+pu7Ch
	 CJSkI0ENiOunRnhNo4bNuWE9qmp34jR2180R1S9lq4F5aghRvdQ5E38yB0U8FUbcTnkmJ
	 +1tkSUUrFbzcaV+qsihwK8+tMViV9l4q4gmX4HKReuNP7E98I5uzdGZkVH+cnCGectw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795561358;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Patchwork-Hint:Organization;
	bh=prLvvr2WG4ZyVyIp1T62Tk/4UIokSlBZfMHsbHEmUrA=;
	b=37Qp8JZfqnJ98D5/bUctVN9GtmdZwHR93ZXBjIbUN2i9sKT4JJcqNKAwWXz39C+kk4oD
	 xDetejg/WxRBvyEJBikuZkoTTrBG+smAQjKhzSwN1DaxqsGlmMvon9S2RlFCYasnPuONM
	 u1HfqUZVnaN0/3hTACe1k5WTFWhojyH8Kf3CZOSbQdssBktI5EtIKKlaohj2cHdpcFYKQ
	 0axyC/xidmXiLJhFUB0qKfmilXijj48XXQyXGFZzgqlrBxIMF7DI7ZLRlE7sQebgF+xPY
	 8/MJa+JexdYXqy0GQBeqWT56oZ/NQy4WL0nujWvArVk/H9RW51bzkbi19ObgzO6Tslw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UITWFy4f;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E154606A31E
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 23:02:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E154606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UITWFy4f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795561355; x=1827097355;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=dtixkPrFwSI5Cayx9vn6Qh1o93tv2rY/0IRNZoDpmo8=;
  b=UITWFy4fwYZuC8qvopEx5SVOYa/H1JKRINXMygm2BDkJBhSvJyDYVCiy
   Pzo1Mh/j3cxrJm0dKuIJjIhLCtK6Aa5MS7nrmTszPgbRrTLRqfYB6SBYt
   eX/ClPYrzf4xgiM9hOy8y4dX+3RsDN7Ty+/JnksvuGw0Ka83vpVtm0iD6
   YmJ3mSb9ALTV1os4AuHepT7vC1KqZcUMSiVL90BJV+eyjJOt9jRB3UgPu
   BZ73/xP815bbEBXZUYFIyAXYFLCAO88lopX9PH7MFOtmS6mbbC8hB1qYR
   ELlqaGi0c6xQSfewDMV+OmeLCEULUarTKy9JvW8PkhV+ww57wOrHaipRd
   Q==;
X-CSE-ConnectionGUID: wgDbe/H9SuiqeoLRhCJLLA==
X-CSE-MsgGUID: x7anr1YnToiXgc0oX7b+Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4344835"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4344835"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 15:02:35 -0800
X-CSE-ConnectionGUID: YYt7k7OMR8q6N7lIgX/dYw==
X-CSE-MsgGUID: c4OvfOsxQVCl0ZY/74YS8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="11896219"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.204])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 15:02:33 -0800
Date: Wed, 25 Nov 2026 01:02:30 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/edid: Introduce
 drm_edid_get_displayid_product_id()
Message-ID: <awYXhjvZvrw3gWea@intel.com>
References: <20261124224621.6506-1-ville.syrjala@linux.intel.com>
 <20261124224621.6506-2-ville.syrjala@linux.intel.com>
 <sashiko-outbox-232161@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-232161@kernel.org>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland

On Tue, Nov 24, 2026 at 10:51:24PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] drm/edid: commit subject mismatches
>   drm_displayid_get_product_id()
> --
> 
> commit 4452aea3cbb2a5afd7ef8a119931282a44feb4c3
> Author: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> drm/edid: Introduce drm_edid_get_displayid_product_id()
> 
> This commit adds drm_displayid_get_product_id() to extract vendor and
> product identification from a DisplayID Product ID block.
> 
> > diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> > index a2617aa34edfc..b44c26d422171 100644
> > --- a/include/drm/drm_edid.h
> > +++ b/include/drm/drm_edid.h
> 
> [ ... ]
> 
> > @@ -484,6 +492,8 @@ int drm_edid_connector_add_modes(struct drm_connector *connector);
> >  bool drm_edid_is_digital(const struct drm_edid *drm_edid);
> >  void drm_edid_get_product_id(const struct drm_edid *drm_edid,
> >  			     struct drm_edid_product_id *id);
> > +void drm_displayid_get_product_id(const struct drm_edid *drm_edid,
> > +				  struct drm_displayid_product_id *id);
> 
> [Severity: Low]
> The commit subject names this function drm_edid_get_displayid_product_id(),
> while the commit message body and code define drm_displayid_get_product_id().
> Also, this declaration is placed in the "Interface based on struct drm_edid"
> section of include/drm/drm_edid.h, where all other functions taking a
> const struct drm_edid * use the drm_edid_ prefix.  Should the commit subject
> and exported function name be aligned?

I was going back and forth with the name and being dissatisfied
with all of them. If anyone has an opinion how we should name
these things I'm all ears.

-- 
Ville Syrjälä
Intel
