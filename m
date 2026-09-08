Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CE959C97C
	for <sashiko-reviews@lists.linux.dev>; Tue,  8 Sep 2026 18:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788891567; cv=none; b=DjoprmkeRNkv0l2ekeC1VI+ejsu8HjCJwLCSvbOyuWqZzYrwi9QMtLlYOohJV4bkecgzTrrD28S7x4mc9iPLgTbBSRmsumasY6NWCTzIYqHuYjW4q7AWn+xKUlBXI5t39ltLIYYQ6ZDGS4hgDYdVlzr0eBPZR2twkhc2T1gFWl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788891567; c=relaxed/simple;
	bh=8AIIo5BF6f71UMl4Yiei2wFPXM8xiGDQCRZjF2KYnKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=V4kqdTgjUwa549ASe46GcrHP+xIQwGrXDbWLj7Cbc3b+pTQH7JbxoXwVBSzv/WyhqtoJFDFfmhmCH3Oy/zU28RYVh0iqSYqXjDhmA0X++bGX6zGYi7l+kqyt5R3vK0M+DHvgyHssQfeY9jGty3RRgLrutog77TAZcrbQntM1Doc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S4cQuPS5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S4cQuPS5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788891565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2Q5G5cxGRzsImEzZzW/QdJtB63ZsfwIeX55psBcS1K4=;
	b=S4cQuPS5c292O8069TX4O84YeUIYn4hu3lyIocXcY/RAKaaylwqPwv/LFyDp+3VNViFc0n
	50YOF8484W1AnQtE+e+U7IgYIklilavuczllVC9WkxW1OF2mP42cTgrg5HGRrOAzXQ/gmj
	h3/x0JAltto3F7qprHAeBrBzOBIc6do=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-HVE3lHPpNA-DR1pBTD7-EQ-1; Tue, 08 Sep 2026 14:19:21 -0400
X-MC-Unique: HVE3lHPpNA-DR1pBTD7-EQ-1
X-Mimecast-MFC-AGG-ID: HVE3lHPpNA-DR1pBTD7-EQ_1788891561
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90ce8ad8002so92603996d6.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 08 Sep 2026 11:19:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788891561; x=1789496361;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Q5G5cxGRzsImEzZzW/QdJtB63ZsfwIeX55psBcS1K4=;
        b=LiduXb/vuF5Ot8kp7O6rQsXLYr2WgN0ZHHjs7ojEF+NB+9A7TxpzcAkGs8O7bozWzz
         igb79RW3DIKdgxD92B+FZQ/ly4VHG9w2oiLK289MF99mcvz4elEolQhGH+CQkIN0E/ws
         q3TAsqApnZWi7LbuF3bQN2wFSkashMMz5DhZictHuzza9zciUcD6oWpvqbxx71flPOyN
         mmlo9xJyXIHvoTINvacSqY1k63PVVyPDgaMve7r07U511XvLtnp75Ssn4qHAe+nmDRjp
         /V1VKxAeC4EhA0iXEZSP8Aw951y1DT9zdmbmDv0aqEknm/TE4eXYQ3d3+v2ndCS6eJk1
         QeWA==
X-Gm-Message-State: AFuF++l3uQWJB3JN9rgZ5HfpGh7eIh+isAIrdi2uabvbyKnE88UmwTap
	pqbaNcztG1BR4bPKTQBgsBpBv5iKxmWjQlgJr5qdKd+gVBhYewEzRxiIOjId+b+pquvq6S0vcEK
	0XOz3AGxO7aG1D9JRbc0s+5CZMvTbwbLO7sJ/yxIRW/brKJAkr29/VfF0gexptIHyRI3kDxsLan
	+udnn+X92q/B5iHkBvYsd9q14je/sEXbjYumO7kzyIBm9SCuCEXkth
X-Gm-Gg: AYBFou0Y08/E7lBAu5ug61y5avw1ef+ET+c8OWc61Hjb0QmklPwIRt1cT3hoHFskhP4
	SAJCJtc6v+N+3+cEGYvmJ5UGmyt0Ce93T6ylPd0G3S9oxBUQ1AART3htbUVXIMv5EBjzmgx4/Ul
	3MKoEsMpD+YrwRhMaw+xp7F6oJ2kGWwCvE7K2kDqdDje+IK4e3LQt7v0cG6ssOxOwdK2vBrOnff
	BSersv9DUpDLWdcKIpLkkO/Zs0jvcogKL5V02eZ5FeEBsfesDNq1Vlz0Was7GZpGymmYQJS83Wb
	Rw1BK+fL4gjwYXkmj1JEFq0wd34AjIINyUxQfEy559FU58Eq/djhcerLbCUVJwse72+wpktKohy
	eSGovzgfAF+tXZZv6M3zolxc7Xchgwty58jo=
X-Received: by 2002:a05:6214:dcb:b0:90c:e3bd:dfe4 with SMTP id 6a1803df08f44-9103ef88b76mr371340786d6.21.1788891561091;
        Tue, 08 Sep 2026 11:19:21 -0700 (PDT)
X-Received: by 2002:a05:6214:dcb:b0:90c:e3bd:dfe4 with SMTP id 6a1803df08f44-9103ef88b76mr371340136d6.21.1788891560377;
        Tue, 08 Sep 2026 11:19:20 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9104059559dsm123327336d6.1.2026.09.08.11.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 11:19:19 -0700 (PDT)
Date: Tue, 8 Sep 2026 14:19:18 -0400
From: Brian Masney <bmasney@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: wsa+renesas@sang-engineering.com, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/4] driver: core: add subsys_driver() macro
Message-ID: <aqBRpviTCjwo3weo@redhat.com>
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
 <20260908-subsys_initcall-v1-1-cbccf4cd4288@redhat.com>
 <20260908175845.A6A4D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260908175845.A6A4D1F00A3A@smtp.kernel.org>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 07m6dJGl_QN3cI-InBIi_9W3sJCVwxH3olvF2naeu-o_1788891561
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 08, 2026 at 05:58:45PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Missing semicolons after macro invocations in `subsys_driver`.
> --
> 
> commit cdf3179a9f2205efd1b552f70b7522e1db5ee888
> Author: Brian Masney <bmasney@redhat.com>
> 
> driver: core: add subsys_driver() macro
> 
> Add a new macro subsys_driver() to eliminate some boilerplate code in
> drivers that need to register earlier in the boot at the subsys_initcall
> level.
> 
> > diff --git a/include/linux/device/driver.h b/include/linux/device/driver.h
> > index 768a1334c0a1d..29fbc01ef06fc 100644
> > --- a/include/linux/device/driver.h
> > +++ b/include/linux/device/driver.h
> > @@ -297,4 +297,35 @@ static int __init __driver##_init(void) \
> >  } \
> >  device_initcall(__driver##_init);
> >  
> > +/**
> > + * subsys_driver() - Helper macro for drivers that don't do anything special
> 
> [ ... ]
> 
> > + */
> > +#define subsys_driver(__driver, __register, __unregister, ...) \
> > +static int __init __driver##_init(void) \
> > +{ \
> > +	return __register(&(__driver), ##__VA_ARGS__); \
> > +} \
> > +subsys_initcall(__driver##_init) \
> 
> [Severity: Low]
> Are we missing a semicolon at the end of this line? This relies on underlying
> macros providing a trailing semicolon in their expansions. While it compiles
> today, it makes the macro brittle. If the initcall infrastructure is ever
> refactored to not include an internal trailing semicolon, drivers using
> subsys_driver could fail to compile.

The other code in this file (like module_driver + friends) has a semicolon
however checkpatch.pl complains if the semicolon is there. I didn't know
if the semicolon was legacy. I ended up going with the approach to
satisfy checkpatch.pl.

I have no opinion either way about this.

> 
> > +static void __exit __driver##_exit(void) \
> > +{ \
> > +	__unregister(&(__driver), ##__VA_ARGS__); \
> > +} \
> > +module_exit(__driver##_exit)
> 
> [Severity: Low]
> Could we also add a semicolon at the end of the macro definition? Omitting it
> is inconsistent with similar kernel macros like module_driver and relies entirely
> on how the user invokes the macro.

Same comment as above applies here as well.

Brian

