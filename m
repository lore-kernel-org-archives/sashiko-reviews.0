Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E941B42086A
	for <sashiko-reviews@lists.linux.dev>; Wed,  9 Sep 2026 20:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788985220; cv=none; b=vB85SyZWcpKOvpKgrda1b0CYS159sbLHwemVgvH+YPuXGdkBxaDcdHqp0vKZa0q7We6EAvn7ePkj6fLPoaRZSilzVfI9FmAhbXY/5EIsGwbDYfkywkk+lqXsKV0rWT5FdYVbpRw6vZtlZP83KXMNXnRks6wUzmp4FKG7RBzgFrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788985220; c=relaxed/simple;
	bh=9jw50TickrTaZQXgt5lOY+a4WpEkiifrBIEHCEFDnmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EFzDK2Tw9VbBxpO3f8uPSW6DrNSNG7czMtm87FSBwHmu/e4nDvDVIcXny9+uwxA+lxzX0+yD/My9iUqCw/5xGwNfSfrHOyEzRc0g/eqeuj+5FXBNCjDIDYpHlhegCfxMz1tumoamXf5l9A7eCSAE3LAxR61jBTnBAYYq2le7cRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QkSZ2wyK; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QkSZ2wyK"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-866e57f63a3so74641387b3.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 09 Sep 2026 13:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788985213; x=1789590013; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N8UCfmj+BAmm+9KzmB0PX4qemdmhN7ZLk+S/oBX8ZU0=;
        b=QkSZ2wyKM/de54yhk4IDI76QZ+yAWf5Haje/qqlWeiVHYW2DAvODcmVtV6k5upNOM6
         1IOw48GXASqdy1LpQiZnUI/sSg0/jEqBVwzhqA2Vmma7O6Zfppp+BP3Oh4FqEG356qb1
         tbl5eWNfUdESp5Qsci3mtQGqv3FQrgu27MNCoYw9a6rZS78rBuyeOnfRPH22fd89vU3L
         2AeQ+HXxRcEDPCjF1gRoiJHlcLhyx8Bf4vPy/9I7yspb9gB6ZRbZfNLrZMtfrCuEU8rK
         dtygf1oWyDBu/pIWQMs0xDGYekebHUNFTnW9UWAweqtXzc7ASZ9KS9ysumNqPzmV0SGM
         pq6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788985213; x=1789590013;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=N8UCfmj+BAmm+9KzmB0PX4qemdmhN7ZLk+S/oBX8ZU0=;
        b=NIol+fBIS+wBxJQ1bX+KpAqBUxb1l06xQ/4S4zbau35GYFQye1RWy2n4QgjvkvKnwf
         rlvgz42OrjiPmcHpLt7jEr9/0ECAYHXFS+HLTFo88cUcM+2yP7vAlhidtpfjuy90pwtx
         7jxtsUEnW9DQ0n8CboBQ904mxGgiDmD79PuO7NgG+BQsjiF1ox5IMhpr/zg19n5iz50l
         lYU5b3p61fxqbVP99BlKMjELO6DvPe4xXVZyJLI6WabOFo+bKZ0tam0N2apu/vXaKwp4
         LDxzcVDYxnpNL+uHREgA7Kf/iuuQZpAomyp7UTIiGPTfuSke9wwBs9XDmP6iIg8XPYDA
         vM4Q==
X-Gm-Message-State: AFuF++lfNulTaOwlpjbSMP0uf+sfBAwviQb5aaGkFHttFMvtEWNp2K1d
	xGv1Z0bLvb2zIX/2Ef7pUbkVfVTuQrJd84l83XoEetL6zwJX00b9r0S+RIpxvPRd
X-Gm-Gg: AYBFou26Uy9dYxhWx9arWrHoTjSSFbR/+P58Uf05RqvniO6eBYCOAwGbi0/KuxTh4Rz
	doV9H7r2rRA+AnQSYEmFftafF/JBxjtpIy6sQ+/Y2VCv+3dRGcxKZBhypR9XvuwqDMdEZAlRPrv
	h//AOLl1ecPGIZVztPeifmMJsSxfi/0JzBV1eGBsmjrE9hZOssYC5Em2ob1uipLhlTVBhiAKYV7
	1io0qTiVN7db2hSO4AwAD0CVQL/gY5O38tl6v6Nhul3ObvPoJd8VyaIyL1Y640UqO4CEFLQTbIP
	Xn2ptoHnIWh7Rb7GpNn8Sg2qJBQ+L2ksa9T5Q0s6qEZxN+dWQZiwGETvjlvFQzPcQlE/5/3rx9L
	ArrQ6xfwU2UzSLGC/9b7kMM/0YtljieLP5u1D3chAMgQnmBj8Dy5y3xTIlvjpYCwPl4KaOHbwxt
	UcguVOEOxJDlu8jkS9QJToi05hQzEzlsLzVGPLsdyj5MZl5a0QeVQNWTWljjqtwduqoS+2aPxK6
	XhKvJnzPCORc/Wwta7feoyvvzFpf9O5
X-Received: by 2002:a05:690c:e1e:b0:873:5ddf:d87a with SMTP id 00721157ae682-8735ddfdbd2mr117164447b3.69.1788985213338;
        Wed, 09 Sep 2026 13:20:13 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:bae:bfc2:7e96:e5c8])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8821dd9932csm2117017b3.4.2026.09.09.13.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 13:20:13 -0700 (PDT)
Date: Wed, 9 Sep 2026 16:20:12 -0400
From: Justin Suess <utilityemal77@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: Re: [PATCH bpf-next v3 07/15] lsm: Add the bpf_lsm_policy_apply_bprm
 kfunc
Message-ID: <aqG7XUBqmUftjyyD@zenbox>
References: <20260909193719.518517-1-utilityemal77@gmail.com>
 <20260909193719.518517-8-utilityemal77@gmail.com>
 <20260909195500.DA3E31F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260909195500.DA3E31F000FF@smtp.kernel.org>

On Wed, Sep 09, 2026 at 07:55:00PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The attach-point authorization boundary for `bpf_lsm_policy_apply_bprm` can be bypassed using BPF tail calls.
> --
> 
> commit 7b53e20161b20c35fb85beb1fba538fe85514074
> Author: Justin Suess <utilityemal77@gmail.com>
> Date:   Wed Sep 9 19:37:10 2026 +0000
> 
>     lsm: Add the bpf_lsm_policy_apply_bprm kfunc
>     
> This commit introduces the bpf_lsm_policy_apply_bprm kfunc, allowing sleepable
> LSM BPF programs to restrict credentials prepared in a linux_binprm. It
> restricts this kfunc to specific execution hooks (bprm_creds_for_exec and
> bprm_creds_from_file) to prevent policies from being applied at unsafe points.
> 
> > diff --git a/security/bpf_lsm_kfuncs.c b/security/bpf_lsm_kfuncs.c
> > index 43a4bf57fd31e..857e9a316d1cc 100644
> > --- a/security/bpf_lsm_kfuncs.c
> > +++ b/security/bpf_lsm_kfuncs.c
> 
> [ ... ]
> 
> > @@ -141,11 +202,18 @@ static int bpf_lsm_policy_kfunc_filter(const struct bpf_prog *prog,
> >  
> >  	switch (prog->type) {
> >  	case BPF_PROG_TYPE_SYSCALL:
> > +		if (kfunc_id == bpf_lsm_policy_apply_bprm_ids[0])
> > +			return -EACCES;
> >  		return 0;
> >  	case BPF_PROG_TYPE_LSM:
> >  		if (kfunc_id == bpf_lsm_policy_from_fd_ids[0])
> >  			return -EACCES;
> >  
> > +		if (kfunc_id == bpf_lsm_policy_apply_bprm_ids[0] &&
> > +		    !btf_id_set_contains(&bpf_lsm_policy_bprm_hooks,
> > +					 prog->aux->attach_btf_id))
> > +			return -EACCES;
> 
> [Severity: High]
> Can the attach-point authorization boundary be bypassed using BPF tail calls?
> 
> This verification-time check inspects the initial program's attach point,
> but does it account for runtime context switches via tail calls?
> 
> For example, if a privileged user loads Program A attached to
> bprm_creds_for_exec that calls bpf_lsm_policy_apply_bprm(), it passes this
> filter and can be inserted into a PROG_ARRAY map.
> 
> If they then load Program B attached to bprm_check_security and perform a
> bpf_tail_call() into Program A, the tail call is permitted because both
> hooks share identical BTF function prototypes (int (struct linux_binprm *)).
> 
> Does this allow bpf_lsm_policy_apply_bprm() to be executed at
> bprm_check_security, creating a TOCTOU vulnerability since the execution
> can still be rewritten by an interpreter?
>
Yes you can do this, but no it's not a vulnerability. No incorrect state
would be created here (in bprm_check_security, creds are still
uncommitted), so there's no issue in actually just letting a user apply
their policy there...

I'll probably just add bprm_check_security to the allowed hook list.
> > +
> >  		return 0;
> >  	default:
> >  		return -EACCES;
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260909193719.518517-1-utilityemal77@gmail.com?part=7
