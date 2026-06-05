Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34CD37DAAA
	for <sashiko-reviews@lists.linux.dev>; Fri,  5 Jun 2026 21:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780695823; cv=none; b=ihQ/uPxGtsuKKk7sxbtra2ahj9jyjjJzAHLv0iFz000Q3OGI7s0mQ96Yg4rjlHMbbG0HxRLJ0BSg0Q2boFcZaeNBFMBtvGS8n3HfyqlOthb/6GbGZH8YVukoGuV6Ip2+rnbAdpNhBUP6Yujsqglcn0owRuHlGQpwolpA2/eIftg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780695823; c=relaxed/simple;
	bh=g/uKp+Kypu5nsKraqsfRJP2QJGUO/CBDdxfUmVZClz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D76Cw66tEp287EPf5MAZquy1fjUAiFA7B9NP5ihY0dyQUmF4Sn1EksPykvsnRtl/22nnAjJkejJFcGr85HZMz1gdAuCVMFjt//1CGMUvEZvDvaiCTvwKuqddjn2HUdnngeOzdgZNa9qFTIzs+trn7aTmgSKunXFwcKOM6QLReU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=S5QQuPRv; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="S5QQuPRv"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-9158c621ebbso277986885a.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 05 Jun 2026 14:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1780695821; x=1781300621; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w3e264EXuF93CA2YNjr7D6CScO/3LfEt9+ewpdao2ag=;
        b=S5QQuPRvGz1tTVuTNoUYKxVWN9Spw9a5rRhynRmxEBUqqRy6CWwFhDoz1OFwVocjxF
         HXAtN2mvgnOcNRb0AHpdSQUkPqvtKQrOm/bELlG9iGyIPoXOJeXKJa+1Ge8nLx2VVYEN
         4fitkRAUzjudHg9Ih0eXvbgcNhwNV2LpnuhzvTYu2tNw1g4XtGnZJNMkuv56b4xgrlVk
         JiwgCHuatwupSjDA4DXSSScD+3nspdNIYz56IoSR0c23ZQgfekIPrOeO9ZHzoDbwmErN
         4zFSlxtm04J8teezzmcLTUHOylQh3C+sIGaEV3v3gE4ceLpTOSORg5dp9UK/QoZAyIm4
         0IOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780695821; x=1781300621;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w3e264EXuF93CA2YNjr7D6CScO/3LfEt9+ewpdao2ag=;
        b=nwHdVnNXc+ZMT4XMdIjIOa6qZNW/7kIfJLh1QM8SslYA+hn6b0bIwsqlryX+lbgLBg
         g4Y4iQBPayFk5rZmGd924lkVbb2FEvhrqJflXkgFx/F88jLOhf/py5zNDN+8+A23ntPk
         O6RfEZvoqBfNz8oyfIU7SPtp6uvS1MKzY9HaPh/V0Qu7pAYfD0BhdWVhArDnA6hfWem9
         i2FFx45dPCl9ycVI/QTdinwW6Atfc+BHMcZAB21FrlBL2w34UTPHPopSeAHq4pZCFAj0
         PTR6uxyqewPEkKER60rVu/VjW3HYI67UbUost2k/TkU8SRyJktyhiHXgxMZSHfSIqe4L
         NNeQ==
X-Gm-Message-State: AOJu0Yy4CEImtATwMJPX8HvEeAn+ORg3Ts82agnXPvyEqln65sda1RK2
	8g2WmUvCprd/gnLtLdCrUmPCCSfXuUwEiJznmSW9R91j21Ff7y41x/8G+sEZKB11fRBKYBUFSC5
	c0UuOVxPnnA==
X-Gm-Gg: Acq92OFU4pQoWOHgmgjjuwXBzY5FApivyAmiji8VXJjnUEcgu2gITNbVOx2wtsS9yim
	VDVaODe5/Qy9hSxQkiZ3mr8XnLzvOeHPzO1xZfJg+SIVYoDf930TkJBUSIoA+Nt/BUv9/s9+ZYj
	YkEnz5sppoelfxOlkpXy9pI2slOyjqgiiI6eAsX4TIqozFlq34HEIMZM4knJjEjrGu4vHRuqzlT
	h1wgTn0ZAaban3NSoMlGbGLDRansc/hf9J36RFoDHy0dIZp7+mkPVSLIYtIN1WmF4UJ1qXCRucF
	Zu8SJrqmVy7CHFYPJ78ogz+930x7W9liUbi90NXehPD0k8dzdA8aEEEYt12c4CmXd8AkqYH6aZ+
	ZCfhZYfjNXlPTURZhlBb8sMxBwYUfp6EmgWqCEhoEF+y4tMfu9TftEU2WdVsVxJyANXdR4DeGhI
	+XbTeb0Qll/5jLL6go2HXp6LKR/sG+7JNCiqZ3bEIanpTgW6lnwhJF9zaoAPs6gqrQAuHthjqeZ
	6lYTM6oVW7K2/7utg==
X-Received: by 2002:a05:620a:1a18:b0:915:776d:52fe with SMTP id af79cd13be357-915a9e07fc6mr980638185a.57.1780695820823;
        Fri, 05 Jun 2026 14:43:40 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a3b3f6bsm996717385a.33.2026.06.05.14.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 14:43:40 -0700 (PDT)
Date: Fri, 5 Jun 2026 22:43:38 +0100
From: Gregory Price <gourry@gourry.net>
To: sashiko-reviews@lists.linux.dev
Cc: linux-cxl@vger.kernel.org
Subject: Re: [PATCH v4 3/9] mm/memory_hotplug: export
 mhp_get_default_online_type
Message-ID: <aiNDCjf-rSVjK868@gourry-fedora-PF4VCD3F>
References: <20260605211911.2160954-4-gourry@gourry.net>
 <20260605212916.7B3591F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260605212916.7B3591F00893@smtp.kernel.org>

On Fri, Jun 05, 2026 at 09:29:16PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Lazy initialization of `mhp_default_online_type` can race with sysfs updates, silently clobbering the user-specified hotplug policy.
> --
> 
... snip ...
> 
> [Severity: High]

Classifying this as "High Severity" is almost comical.

If we want to address this, then we can just slap a lock on the global
and call it a day I suppose.

This seems incredibly unlikely, and a good example why a single global
auto-online policy is bad anyway.

> This isn't a bug introduced by this patch, but exporting this function for
> asynchronous driver module initialization paths significantly increases the
> probability of a data race with sysfs updates.
> 
> Can this lazy initialization clobber a user-specified hotplug policy?
> 
> If a driver calls mhp_get_default_online_type() and reads the uninitialized
> state just as userspace writes to /sys/devices/system/memory/auto_online_blocks,
> could the following sequence occur?
> 
> CPU1 (Driver init calling mhp_get_default_online_type):
>     if (mhp_default_online_type >= 0) // reads -1
> 
> CPU2 (Sysfs write calling auto_online_blocks_store in drivers/base/memory.c):
>     mhp_set_default_online_type(online_type); // sets user policy
> 
> CPU1 (Continuing in mhp_get_default_online_type):
>     if (IS_ENABLED(CONFIG_MHP_DEFAULT_ONLINE_TYPE_OFFLINE))
>         mhp_default_online_type = MMOP_OFFLINE; // clobbers user policy
> 
> Does this unprotected check-and-set sequence on a global configuration
> variable need serialization to prevent the user-specified policy from being
> silently lost?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260605211911.2160954-1-gourry@gourry.net?part=3
