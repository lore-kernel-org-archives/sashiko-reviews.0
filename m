Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B12C3859C3
	for <sashiko-reviews@lists.linux.dev>; Sat,  5 Sep 2026 14:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788617653; cv=none; b=Dbrno+mzNWlMgL/+nlV52mMUVH3gINtq1JIU1b+6r3JwBc0TodD7CfpZO7RB7oTEvJqyfx1LVs3GBBECeKvRl9I/442stvo0xklIvd8Fz8D0WeX892LNrnyjjACuqfdH0EiAOCPLoQUQU+pVd7BIAALqYq6/akhM98JtjZzyluM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788617653; c=relaxed/simple;
	bh=KXg1EAoM0/RMl7c/jKhO4NdJWpFjacna5aRKB0RlsSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ti0s4b8DwS6vip/swzULtp6p42X5Xfp3iHuenVI3tWMX8XRtG9IP7rKIm4qYEDs6yOMfRS08Yrw+ZZUTVgUTGV+6elpdFB/VGsrCVMFkwXYKbCeMspWC5G/nCIHS4/DDBZQDytPpkPOaVQvYX+U/wKKqT8lewjKXvxVk4paaEbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sdZ0Vyj5; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sdZ0Vyj5"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c9e7391839cso2019749a12.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 05 Sep 2026 07:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788617646; x=1789222446; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nUSMR9Rv7P0bE66sYv7P+jDtBU38A8MZQ8qP3Q7v8aA=;
        b=sdZ0Vyj5eMBVw41R+ZAMGhs94BETvh2z+PMrA3DoZ+pamvh758YP9J77PY4VsS+1xg
         8TPOv1sZoTz5d+CWjyNjp5u7Iv1kwY4nDGYhhHk1NZd4vVHOD9fdQ1vq7CblUANJsYFl
         wgsljyBX4UisPxr49/hbn8CHH8WfnSvK92KQwAHUBdc9MSIFLHl/iFYwPn8ZJPjSJ9/V
         kGv3rY9qhteMe8P5ZBd4GH+RUZ+SILYxtUK7gw6xTrr5Zk+oMtMai12bCtFW0AEPiSH1
         9eNxsg1LEr29DeFvF7+gPIKYkBITQmdQnaJIZ5L/IzqpjeebrhQSNJxlHkjec/i8baD8
         y5iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788617646; x=1789222446;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nUSMR9Rv7P0bE66sYv7P+jDtBU38A8MZQ8qP3Q7v8aA=;
        b=M8kSJQ8ErkGTvb5WMbP+jSBTFmSKRdPXhA+frqqFHgl4ORHHwQeotlg2CBuQDlN5fU
         SvkkW0EI6pHYoGvRk2gQmuxC2F3AudJ469uFkh0LDjyNzyQw+2iWuroe0aokEPDvwQ5X
         ex0TjlFTtN85ijjnmDjn/6yHggZMXQbCFeTIcqZEx+MwBX6/IjfGhg89Ixu9qsnjW+QY
         r0MkVvKt9QrSUk6ieaJO7ApOwmfPqvk7k9Bvl6QJzFPutyv63njvSW6BcuvrXfdq6obE
         KXul8VK3Zr6WXVlwlYVs06hglYCQ5wOzfiRRkBIM90Nnoo0BZKjOKpI+35cXqWxc0FNb
         EOZQ==
X-Forwarded-Encrypted: i=1; AKwUvByAiqw4VADBX/hJ+tOhWnwxgqg1jDrepaISd2IayGfW4fV3bkk6ANNj92u9YUMkByqEWn4ATaxFqG67C5zs82s=@lists.linux.dev
X-Gm-Message-State: AFuF++ljeRdNNSqaZvrn4S4Hm8inAtSFeARgFEdwd+d1rZ97MsaHADSs
	5ba0c+OL+a4G3r8Dll3481VN23UcbLEPIqvL9LHY4e2N6bcSwiqCdJCi
X-Gm-Gg: AYBFou1FRCpYq2B3onbnl3ShbWzMXHNj/F0BWBat2GYLJMUSTa8NJ0tPoVRznm6uCP/
	+8gjo2koWwjwRGonXqkuEIF93bnpp77VpINSWEY5QDpmFSb+YVmJOmCQaZsGvLX/oJbIJ7ntMgP
	4l8kEaSDvN6HqSY+X6J6hCBDeT9EylB4V7hhEu7sDuATHXT+chS6Sajx0nGYDvXJHQ+yqri3yz/
	83lzmr75nrdhEqQfL0m5ArheqgfpVzH3keuAoO08hW++NevO4Z3mnot9OaEdCncLmq7fXJ8rhs+
	yi2A5wGKT60pl+MrtGL0TAv/ERlFnQjGqGAiW7m2JAQcW59tcy0orh3FNzue2RfyDHK3t+9lw8J
	+wONxYgIyX4imdVlYr3rAg89Xk65RS7mJyQKL0QXkCf5v//hCKuwsnqiyZhmcuBYSublMaNibb8
	iyWb/TbXmbId2a/r7OEeLgM9+Y667Z8N4ps2b9Y3igZnvGD8i5mVQxx86gotn+HPxp//s=
X-Received: by 2002:a05:6a20:a11f:b0:3c3:b57b:6285 with SMTP id adf61e73a8af0-3da3a0af18emr17785724637.13.1788617646498;
        Sat, 05 Sep 2026 07:14:06 -0700 (PDT)
Received: from celestia.taila51cc2.ts.net ([115.164.90.14])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc46b4cd51esm653669a12.2.2026.09.05.07.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 07:14:06 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: sashiko-bot@kernel.org
Cc: aethernet65535@gmail.com,
	damon@lists.linux.dev,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v3] mm/damon/core: allow esz to be set to zero
Date: Sat,  5 Sep 2026 22:14:09 +0800
Message-ID: <20260905141416.4347-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905125825.BD5D51F00A3D@smtp.kernel.org>
References: <20260905125825.BD5D51F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sat, 05 Sep 2026 12:58:25 +0000 sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] 32-bit integer overflows in time quota and throughput calculations lead to severe miscalculations on 32-bit architectures.
> --
> 
> commit dc1c35769ce920ee1796367097f9876b2f24a643
> Author: Liew Rui Yan <aethernet65535@gmail.com>
> 
> mm/damon/core: allow esz to be set to zero
> 
> This commit modifies damos_set_effective_quota() to allow the effective
> size to be set to zero when the goal has been achieved. It changes the
> order of max and min calculations when quota->ms is set to ensure
> that a zero esz_bp results in a minimal effective size instead of being
> clamped to min_region_sz.
> 
> > diff --git a/mm/damon/core.c b/mm/damon/core.c
> > index ce8c6f99106ed..3e9c9b6385d4e 100644
> > --- a/mm/damon/core.c
> > +++ b/mm/damon/core.c
> 
> [ ... ]
> 
> > @@ -3259,8 +3260,8 @@ static void damos_set_effective_quota(struct damon_ctx *ctx, struct damos *s)
> >  					1000000, quota->total_charged_ns);
> 
> [Severity: High]
> This is a pre-existing issue, but does mult_frac() silently overflow on
> 32-bit architectures here in damos_set_effective_quota()?
> 
> Since quota->total_charged_ns is represented as an unsigned long, it natively
> overflows after 4.29 seconds on 32-bit systems. Furthermore, when
> calculating throughput via mult_frac(), the remainder calculation
> (sz % ns) * 1000000 can silently overflow a 32-bit unsigned long, which
> causes throughput estimation to be completely incorrect and often near zero.
> 
> >  		else
> >  			throughput = PAGE_SIZE * 1024;
> > -		esz = min(throughput * quota->ms, esz);
> > -		esz = max(ctx->min_region_sz, esz);
> > +		esz_time = max(throughput * quota->ms, ctx->min_region_sz);
> 
> [Severity: High]
> This is also a pre-existing issue, but can throughput * quota->ms overflow 32
> bits for quotas over a few seconds here in damos_set_effective_quota()?
> 
> If this wraps around on 32-bit architectures, it improperly clamps the
> effective size to ctx->min_region_sz, nullifying the time quota feature.
> 
> > +		esz = min(esz_time, esz);
> >  	}
> >  
> >  	if (quota->sz && quota->sz < esz)
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260905124706.3398-1-aethernet65535@gmail.com?part=1

Thank you for pointing those out!  I will fix those separately.

Best regards,
Rui Yan
