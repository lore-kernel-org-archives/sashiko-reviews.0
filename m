Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360DF548563
	for <sashiko-reviews@lists.linux.dev>; Tue,  8 Sep 2026 13:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788872550; cv=none; b=FkNiwzQdCLFyT4qLaP4bUmugwc6H3UYbF6dCzDW0BnGy0N8uUTqEMbgl71aoqbCVWwP+AlDj+yrnAoaxODATe+NyVnsRpIg8Tk6bxXkykbTbSeLTCUrwxZsU9eWhXpD+oRXSPJzBlxvBqHwx5YxX3w9FIiAUZ6vKoRouGi4p0a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788872550; c=relaxed/simple;
	bh=dn92Mo88uA51N0gSIQRdK0p8DpIE8ybkptRjiyJjPbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y37h7Au7b8do0xgPRihZ1BXKf8C0Wj7txHzz0FXLxVP3yzQRwSnorRNbx8MWjzagmDq67QIIIqNFTswtT9tMYcHCiM2Hh1nU6YNqQKndGs8gVEqItgIYpi5RqNwNUL0MaxuqhtMNN1o8LIKlruqrITaQB8jH5Zr6whYucdR58wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=VIs0HMwS; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VIs0HMwS"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4843efcbdb2so2657341f8f.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 08 Sep 2026 06:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788872534; x=1789477334; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BJ1elAf4v/bn33w8Prh48yV0z8gg3E6Slnlr125hPM0=;
        b=VIs0HMwS/Jq3ZYOMPkEc9aNLtrXkprHf77ETMrl1aCFEhrxw68xW+mEwvzd2Wh6bnv
         6KT5J0vPxL8eX4OK97ymSXnOyg+DwVoukVGAz2DDOl+7yjpDxe0wBPFAkCfBc8jyuoM3
         TZL0uSSVy+orgmdeG5G4R+ykLHHMK+KQIfNoxMS0pEoXJ+Ys/nSgxg5x/AWlmxmqWWRu
         hOb4lzsV7DTM+7bTtVpL1NDcLtUfZ+FAa+Lu4pU6zzjcqjFq0xuQ0KdaaVOImyO8QByX
         zQ8uoLaZXM16Y16hv3SF5WEp+1b3NRJk2k09sCSKe3qbXCr+Lryysa3O7UySr2nkYuCH
         E4pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788872534; x=1789477334;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BJ1elAf4v/bn33w8Prh48yV0z8gg3E6Slnlr125hPM0=;
        b=OO3yZeTGdeAkUU+6IzCX41yB65q4ikY1MI1hTD6dHTh2io4VbeEPldJT/mfZx60Tp+
         lEP3rBCGwasoTzewGfgOkpDGPtyZzbnNG7s/3heiR4jwUyvSCO0yclRqK7KdnwnIUfV3
         pyGQEgdvK4mR8iKG1lF8Iu+DmO89mK5qXplbN5p8MnkLiL4Xn22jlV+OGbgY40ulMI1h
         B4lGJpA6U9EuvzMRA/zWUfdIj0YuXkxwMhkvSzTagVMmCd6456XPWsmoOVzG3OEpa0yn
         hPalH3VehH4PXSozLcsvH/U+mnTfFchU4QGCGFmCGWI27vXioOMjfFakrNkgJBQhtWa5
         4hSQ==
X-Gm-Message-State: AFuF++mUopUlGr6B53Zr+O8Ns5EuYPXxIctDvjn8VD5NpGb2GIKw+pPu
	UA00yvz+D/pcmN0HFvlxtAVGhKehxRDqsp17y1gwKc1iWk0qL/aHXHoMOfOASgSlKy4zaZKY3HD
	GakgiR9U=
X-Gm-Gg: AYBFou2kbgV235WeITpR7yneBe2L12QUHk3vNs54F2Rwg6/KG/OTKoz/ksahq4v8OQK
	tP1EeEB3DelJaLAvo5/BbvnmSwfsMUAL7TN/wqGoTUHBbnGaXkY5wmvzt22esgA6btMcCXm19qh
	WYzaY+T6SEEUwpSB56dJ/OYHd9l+FDwK2jWbrtICsnYMXtPR3LwCam81NG4gKFyM0m6wM8dn2ua
	/XnEqP5m5/7qkNABTlhDMagd7vlKvSuIkaV+4xIqPO5aU5pnLzKN5sr331lhRgqh+PVHnV0jGLN
	hveGkNQnWd4POhi2EFFc0HQLv9t0TPg1h33TZiyk+Vl0GgQ/vuOWCAj7HWGrzUImxNpgIzVMYXL
	DWLQ/uVS3zjXnwKI1fu79Hbxx5BTjidoNesZHGdZlnvk7ziGUMM/uLTn6CVpSdoqaL9bFoo5GsH
	aICnGAEvdcgmSrMa+4JgD3zUhczLMUkFDOPi90jjJGrOZkLcgc0aMRA93FNqCKKQ==
X-Received: by 2002:a05:6000:2010:b0:485:8a47:5b92 with SMTP id ffacd0b85a97d-4858a475dadmr28510814f8f.47.1788872534455;
        Tue, 08 Sep 2026 06:02:14 -0700 (PDT)
Received: from pathway ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885b7bfasm36713640f8f.29.2026.09.08.06.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:02:13 -0700 (PDT)
Date: Tue, 8 Sep 2026 15:02:11 +0200
From: Petr Mladek <pmladek@suse.com>
To: sashiko-reviews@lists.linux.dev
Cc: Harry Hsu <x90613@gmail.com>, joe.lawrence@redhat.com, mbenes@suse.cz,
	jpoimboe@kernel.org, song@kernel.org, shuah@kernel.org,
	live-patching@vger.kernel.org, jikos@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/5] livepatch: Fail object initialization on
 duplicate patched function
Message-ID: <aqAHU9Qecqvl88VT@pathway>
References: <20260908120325.299649-1-pmladek@suse.com>
 <20260908120325.299649-2-pmladek@suse.com>
 <20260908121744.81D641F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260908121744.81D641F00A3A@smtp.kernel.org>

On Tue 2026-09-08 12:17:44, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Atomic replace patches will fail to load if previous patches targeted aliased functions.
> --
> 
> commit e5553650270f93e11fe885d264a3829802223d3a
> Author: Harry Hsu <x90613@gmail.com>
> 
> livepatch: Fail object initialization on duplicate patched function
> 
> This commit introduces a check to prevent patching multiple aliases of a
> function within a single livepatch. It fails object initialization if aliases
> resolving to the same address are detected.
> 
> > diff --git a/kernel/livepatch/core.c b/kernel/livepatch/core.c
> > index a240d1144e89c..a6762cbe74b70 100644
> > --- a/kernel/livepatch/core.c
> > +++ b/kernel/livepatch/core.c
> [ ... ]
> > @@ -885,6 +885,21 @@ static int klp_init_object_loaded(struct klp_patch *patch,
> >  		if (ret)
> >  			return ret;
> >  
> > +		/*
> > +		 * Aliased symbols share one address, so they would resolve to
> > +		 * the same klp_ops and stack up on a single ops->func_stack,
> > +		 * leaving the redirection ambiguous.
> > +		 */
> > +		klp_for_each_func(obj, prev_func) {
> > +			if (prev_func == func)
> > +				break;
> > +			if (prev_func->old_func == func->old_func) {
> > +				pr_err("'%s' and '%s' resolve to the same address, aliased symbols are not supported\n",
> > +				       prev_func->old_name, func->old_name);
> > +				return -EINVAL;
> 
> [Severity: High]
> Will this check inadvertently reject nop functions generated by an atomic
> replace patch when previous patches targeted aliased functions?
> 
> If previously loaded livepatches targeted aliased functions (for example, one
> patch targets __do_sys_fork and another targets __x64_sys_fork), they were
> permitted since they resided in different patches.
> 
> When an atomic replace patch is loaded, klp_add_nops() loops over all
> previously patched functions and adds nops for them to the new patch. Since
> nop deduplication is based on old_name, nops for both aliases are added.
> 
> Later, this check in klp_init_object_loaded() resolves their addresses and
> finds duplicate old_func addresses. This causes the initialization to fail
> with -EINVAL, which prevents the system from atomically replacing existing
> livepatches and might force a reboot if the old patches cannot be safely
> disabled manually.

Wow, this is a nice catch. I would say that it is a corner case but
the problem seems to exist. Now, the question is how to deal with it.

I see three possibilities:

1. We might detect the aliases in klp_find_func() and create only
   one "nop" entry or do not create it all.

2. The problem might be easier to solve after adding
   the provides/obsoletes, aka replace set, feature [1].
   It should prevent loading the other livepatch for the aliased
   symbol in the 1st place.

3. Just document the problem as a limitation. It might be hit only
   when installing more liveapatches in parallel that current
   wild way.

I personally prefer to wait for the provides/requires feature.

[1] https://lore.kernel.org/all/20260607131659.29281-1-laoar.shao@gmail.com/

Best Regards,
Petr

> > +			}
> > +		}
> > +
> >  		ret = kallsyms_lookup_size_offset((unsigned long)func->old_func,
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260908120325.299649-1-pmladek@suse.com?part=1
