Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F26D3F329E
	for <sashiko-reviews@lists.linux.dev>; Fri,  2 Oct 2026 12:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790945539; cv=none; b=FnC9aIQoMAbaKmVQdFRQi3CMDBj/dNoBBTldEQni8sosax3IcHP/gsUU2eD3S5dCCOnOW6wCPY82ayfYBqBC/P9OEd9ohoxvY4tr9k5PpB22vKudIzFMWR/yI4gnoQVsYgjsLW8rylTOYuOLqoLiYOb1QSPABeMW82V6TKxmp/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790945539; c=relaxed/simple;
	bh=f6JvRf5cXMcwuYhI5B1gEJ3HcRG24XuF8kIGhCAv6MA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=aOq/NusNnyweZAjlHoXyJ+6aEgE9gzf6a6k5vDcQLmaZFW8PhX6KS5HJM8ZPK+5fJhODYc6I+6amhwrm3PNP+hbf7+r7v8y9fea++gh34L1iwqCQWaKhbu0xZIT8cRe27kP2WyH/y7Y6/1DPf68SXcMg/UhwZeKbKoZjZvD6MWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a0fzFgLo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a0fzFgLo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790945537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tCH7oA4DdPw+pCkiWuwkP5ynmVOdNK54ww31eSeUk6E=;
	b=a0fzFgLo1Znmomj5C37P84t9RmLkAKa6KC7Yew4YFvPbq2zU+MlDGGcDLtlviEf3KZ+L4U
	EZuaxg5v/tBsE8wj10I4S/VpqybCU7BPxDl/EKBdYdU1vf+VKlbF1rmhjTCmKSWcc8dOpz
	efb7u6qiO8N4qgTXQOkzRmRQJkZNZO8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-410-xXegnkzePiy0lC9lbIOINw-1; Fri, 02 Oct 2026 08:52:15 -0400
X-MC-Unique: xXegnkzePiy0lC9lbIOINw-1
X-Mimecast-MFC-AGG-ID: xXegnkzePiy0lC9lbIOINw_1790945535
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a0228f4a1bso32945e9.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 02 Oct 2026 05:52:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790945534; x=1791550334;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tCH7oA4DdPw+pCkiWuwkP5ynmVOdNK54ww31eSeUk6E=;
        b=GD1eH1qi1uSRZ5uzfXOg1QaxT6O1MkciEFM+JvbUfSQ9ROZtdlR3xDdiR+6+RuUrIv
         DfJZywUeQZXaZ+WyirzmtFSLyktiCC8oZHJaOAjnfwPhWULM+uCQpZodEq3GHk10wEn6
         UdEdQDCACWPNuDWBwKvUcCU2e4ce3Hj/yMPamQPBhFWv8pWFW8Wu5b656nUABCKFtPj8
         PoxCPiSWagnJ8i3ISsQe5CyDKr5Y51F3EroKT3aEG6zqD5M17aMzxddtyTw8AkF3HKGV
         1j3yMnmIRs1UsS2UjqkeVaYrmwkvMn+xAq9NzZR6+/9sv+JYo+gx/KbBpvHWccUSHcV7
         ow1g==
X-Forwarded-Encrypted: i=1; AKwUvBy74W/qug2m0su+e4uc0mz7/xK2dyTvfIOS6RdSrw37C1iAhrwq/UyXjxv1SvehJiAxJNcjZ5RndOyB1EQ4KXU=@lists.linux.dev
X-Gm-Message-State: AFuF++nEDo6y4WlgvnRBg9adzTmY51pIaRGZum+H/iiSv79s4qE3mi7O
	SEyGUkq/yVPa+PcjBu6KoJ1qOI3M13cGNDzr5CwmHIMuLbV5tYCBHsKBdBNpsueZJll2nnfIaCT
	ch8QyzsKt4xNHuHHL7cFt2MD6uiGeGRnGCWsVDkoz+4XgtbrnSkTZkNpMN1CTfrjm8Fwd7Q==
X-Gm-Gg: AYBFou1WnSvzMpAM5CWMzeclgda9xiEE1/QJrx/bQ/pFmi5INNvFa7Fcd+noKS9+qBE
	5R6bTPQZknASTN2QQMjT9wsO2PtBRouMZ6PyC3qGHLhCcvNcsEZrZ3hCtEK/QFzrL2hfniaXORO
	eAKBOT4vxDeh0AtiVV/+mSyp1DDlZ5NpSMOOF/6wXSgJ5M0Bzb3wJ9bAZWjx0NSKVzRvXRCrZQN
	WNyddqWuJcYoa9P//BHZCkZ1MrareC3XrjJ7OTf4r+Np4gUitE06zmcE0nux2WNnpumupbYd+YF
	gGbQjY5wm3q+8rXZraBQDgYbg19Dt5CpHPU26B48NKk1aPm3nZiFsgWdCC0z853U9cI0qP0YYFH
	S3eHE0gm2qBB6WxyruATeUYDjx2VAl46jffj2gkXZnAsBJWM+vu94OWd2tQbNQspRbQ==
X-Received: by 2002:a05:600c:1911:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-4a02756643dmr43591525e9.10.1790945534471;
        Fri, 02 Oct 2026 05:52:14 -0700 (PDT)
X-Received: by 2002:a05:600c:1911:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-4a02756643dmr43591275e9.10.1790945533987;
        Fri, 02 Oct 2026 05:52:13 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38105239sm7570526f8f.33.2026.10.02.05.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 05:52:13 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, decui@microsoft.com, ssengar@linux.microsoft.com,
 andy@kernel.org, gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 sashiko-reviews@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 7/7] drm/vc4: Do not include
 <drm/drm_simple_kms_helper.h>
In-Reply-To: <20261002124456.741011-8-tzimmermann@suse.de>
References: <20261002124456.741011-1-tzimmermann@suse.de>
 <20261002124456.741011-8-tzimmermann@suse.de>
Date: Fri, 02 Oct 2026 14:52:09 +0200
Message-ID: <xlv15wzk6z9i.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EN3GmYumU3Uo_LJV90ZrkVZ3yxq7MtOYS-Cf6VJh1oc_1790945535
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The vc4 driver does not require anything from the simple-kms
> header. Do not include it.
>
> Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

