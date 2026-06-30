Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B866F3FF1B1
	for <sashiko-reviews@lists.linux.dev>; Tue, 30 Jun 2026 11:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782818204; cv=none; b=kdHJKBDVMgP1K3bHTNpS4Q1998nyC+ZcdKF9jIzwIaBRA762pXtSgA96AYfJcjK9bd0JiyyMYzH4NZxN08OP4p1voywAAvxd09wUV4qGYBD+s7cApy/5vNAzQRfP876/fTGCTs+5W0WZOveDslosIpBUY2VPtN9bukk6TBu3Fz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782818204; c=relaxed/simple;
	bh=bEON7K8Vr8Kx5q5byvQDSczhV13SQRe7zMRCYJBiu/w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GzrZZ5kR9CAVFgU2awR1/18vk9vJuBmWxI7NnBaeGxMTzSdf6VCaCmTpzIzo46Wa8My6twBj2+0rPXH7iaR3Auyri8ZqpUPBg52EjuRApL6A0EoIRx6qc1ubia8/4JReZm6zPENynGlGxPgEQdLU+48CG8QBJ7wlC29I6WUuuDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZL2iACrJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZL2iACrJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782818201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uK4u7OlksOPt/6U/1SRzlgkV9O8eOQE5cC4CBUyYFcg=;
	b=ZL2iACrJUc2zI0wlNzNlxO8yeYuVofR3ZrNbk+cN98B2bIRyq+f9xgGyjr5vH8rpCPeWEZ
	+vXMhPTGD75xPQ+AFVkJgASTlpOIt4dPhKa+zmH1WZYcgtfwQ90NOC/BiclTEzfKsuH5ry
	tBxi09q9ktyXyFbskkW4qdlxDtwYnTY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-260-uRWND3oyNuW_pp4quBZj3Q-1; Tue, 30 Jun 2026 07:16:39 -0400
X-MC-Unique: uRWND3oyNuW_pp4quBZj3Q-1
X-Mimecast-MFC-AGG-ID: uRWND3oyNuW_pp4quBZj3Q_1782818198
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-493a6135724so21233505e9.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 30 Jun 2026 04:16:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782818198; x=1783422998;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uK4u7OlksOPt/6U/1SRzlgkV9O8eOQE5cC4CBUyYFcg=;
        b=Ht8iChkkT06pciDeiIeQ3cWurWBdQuDnYDdL1Q7553HqH1n14WbHxsmpGo7Suq79HL
         6rZGDAdHwbkNitKeM2qmUAv2UfSArBhU22x8YLlFkB9f5FYROx9FF+hY9cka6ZYrVdHZ
         A2bOfFwaCWSKJ3Tw9jUM0Ljq56Dt9bNcRAQpZk2YpPpMOGxuQBBi7I89KJWylCdbr2LS
         1TSjfk5OoDvKP4ET8aVOdDvMwd+Cs8n/uD407ZaYTfr1oynWls4X7ZUYMj2Hs/bG79E9
         LH8UPm0Gtyl60EpYuRxBM5d6NLAwfwn32M06e/rn0A/H9zv0tOsmbUIHK+i+irpXExn1
         r4Ew==
X-Forwarded-Encrypted: i=1; AFNElJ+MEKVRZMVNqVbJHfax/VUgdvnnRgavaAuCGgLtJtGIwiKyYFkY88FkEGuUmYfeWOQVM3TeXj1bsodPfNItItM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzfK+dczHBaGn1NX4GLTmsBNXrtMQvQY90J2VLsGMuPLaCIk3g+
	lG2nipNMp6syJNCM7VdZKehABWSc1/TIBRZ9qUczJz4RlRDkx9okT2yXomw1EP+9xvVPuuXGSJ8
	tyKNEOIJLBrAm1exwMES+O5Lfumo8LNK7jmNzXFl2y01zOHWDxy8aAHOOvNl/H4tuToLDKQ==
X-Gm-Gg: AfdE7cm5dfnomBpE5zZJpAY4KcqfjydJE7XFzWnKrwtynnO5u8EKpp/20SBf6bfWfHX
	d2gXJvTSYQynJiM0YbXviVdaJ1LMzzCKo+ZUsr5BEWRu2Uq9CU/bY3f8z602h/h+x2teGnf9hZh
	Ch2EMOv9ZNvUTrWMoUT7h74vCHyUIlFh02Bkno0wQxjzWO8UvIfspEfXAAuj6Pwl1d2VbcHL0bB
	x3KKNHYXJ6ENlaPLnay/nZ3nimzwjcUwEOiA+2u36M+x78X7eEeCvvLlEW6KvXzEVipqSVYXHWR
	iXhLaTjPCKzQmUGqFuQv/PCvpVzS5U4+MSiu351QX8+Bpu5mZMMIIkRU9byiJCm/2VkgZDt6eQE
	09XuolVQQvDJkYWN7k+8h4J2M7EunBdiXXUGS4bmKhfCoYFka4D4YxcVsH2+B+RYH74tfbg==
X-Received: by 2002:a05:600c:4752:b0:493:a6b7:cae5 with SMTP id 5b1f17b1804b1-493bda7170amr1944675e9.28.1782818198015;
        Tue, 30 Jun 2026 04:16:38 -0700 (PDT)
X-Received: by 2002:a05:600c:4752:b0:493:a6b7:cae5 with SMTP id 5b1f17b1804b1-493bda7170amr1944225e9.28.1782818197518;
        Tue, 30 Jun 2026 04:16:37 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493b8ccc7d7sm64473555e9.2.2026.06.30.04.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 04:16:36 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Amit Barzilai <amit.barzilai22@gmail.com>
Cc: airlied@gmail.com, dri-devel@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 sashiko-reviews@lists.linux.dev, simona@ffwll.ch, tzimmermann@suse.de
Subject: Re: [PATCH 1/3] drm/ssd130x: fix column and row end address in
 partial updates for ssd132x
In-Reply-To: <20260630110806.23204-1-amit.barzilai22@gmail.com>
References: <87echococs.fsf@ocarina.mail-host-address-is-not-set>
 <20260630110806.23204-1-amit.barzilai22@gmail.com>
Date: Tue, 30 Jun 2026 13:16:35 +0200
Message-ID: <87bjcscm7g.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9LLKgVf4t1m-PHw07EzR2ikI2r5xBQ8RzE_tTuPFC7s_1782818198
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Amit Barzilai <amit.barzilai22@gmail.com> writes:

> Javier Martinez Canillas <javierm@redhat.com> writes:
>> Up to you. As said, I don't know were we draw the line so I will let you decide
>> if you want a v2 with the tags.
>
> I don't believe the usage was enough to warrant the tag, since the LLM only reviewed changes I'd
> already written and reasoned out myself - let's keep v1 as is.
>

Works for me. As metioned, I'll try to review your patches this week.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

