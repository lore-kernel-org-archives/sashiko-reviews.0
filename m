Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46C3361DB8
	for <sashiko-reviews@lists.linux.dev>; Fri,  5 Jun 2026 14:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780668918; cv=none; b=OqMEzOALY2pnFjjK1WJ6yXK6V4lOqsZpVdAWV57Lfqi4QCZ70Qb1LLH8IhdZlvrTaT8OoCaGUB/PXWP7yRxqB0JfdE+mD7fT+PpdPsq/HG0A7P0pVxZzV6RPVduQCon/PX2MDWY18LdxirwuuesxTbF16OmiOcXK/nYcuRZ8unc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780668918; c=relaxed/simple;
	bh=ar7PNNwubFmz/KFNVROu+Mptdoo1p3LJaovsqO4uKIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D6uX03qzJfIZzsBXk9o6eRpDHdV6R21N8nKp1COraais36sqIOYBicMwnUI/Ym/mkJaZzqdEgrMhqFo2qY6W0GOiuCFIzzniBSACW0xfm4Ao7JQng1Whgt6Gn3spacx6woA27bsNIfR+ecqE90d11YoMueBuTiVlxF3pWH+oroc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QdxI9mtl; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QdxI9mtl"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45eedcdaeaaso1462821f8f.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 05 Jun 2026 07:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780668912; x=1781273712; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k14EL7aYp7IEaeb25debKuZ2KvULiegeh2pxlfcnkdQ=;
        b=QdxI9mtlh4ZanMkj7P5rfXLcKicqGorzYPSQulVKoTGmVTAIgR7E8jCVVJyUcrw5fN
         kL4hjEj88/ruOQmLoSfRHcnGIJoxMByoDuzubpiWky3iEAG1+tDCYa6tFdv4n+5I3E9c
         KfWrPX/TzYh9hVDntJwzKIK7vcMGD9FeASV74jMPOD0PI9MGU/YH7bqYnIgdA6msFUzk
         Zzno4E0+yoidMa5TjHysFSJIhpHFYVn9kDgamSQkIbul7DJWC45/fPeizb6yB0ijpkTQ
         qPQ9iHi7aeN59+jb+gLTG4+W6QtChyY4Ah9zcWE/otqDdwND3b5dNzHUlPSHt8o9gMY4
         Clpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780668912; x=1781273712;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k14EL7aYp7IEaeb25debKuZ2KvULiegeh2pxlfcnkdQ=;
        b=FvfadiftzArz1uGT/28wm2bl5Eth1n37XG1Sz6/P1j4M5aloFBBnJfj+mwaSXMmXAA
         4VNk+GyPI3JFloK9F/UojmTYwfHrerrQnVktHPeSeMgc8iDD8YgxUXyBKhPcwCeEG/y1
         pU3Plwvno1RUowGLQS4+Ox3488tX7JD49BcXGkFVvfam+DMbtpKmBUi0T8zFoAKpJp+d
         gc8cZnOVXbDg0WdpDh7smxG/T2KGpZgbjjM3Lca1fkygCkJNLW/XW0Bh9VRXHg3juSFT
         ybiQTyoKHHhuvxaKLG3nPg3xi1FV53JaCGZ912cXemtHI9VXi3+HfN6iu89Fz6B1cAA8
         xP4A==
X-Gm-Message-State: AOJu0YxwkvvzMg71VRvWQR467Eha+3NYhER9plwUY1OWoOSpM7GonQnG
	872VPb+Vg4cwV9s2x/sX0ATajAhM77TtQ5rQTIILRa2TUOJ6Kli9qJ/pIXUJyWOmzmqlsZ8sXVs
	ULUli
X-Gm-Gg: Acq92OEVYNeR/K/hyl4FH9UpOYqpQm0zdJ6mqcYCiZj8vpd/XQuDh4lKtbE9nkRe9hR
	n998opIiELzp4NySr14xUYpk+ntj2TLeDIhaJSam/fuiJj8iTG1zvcK+6fnrHQPqCO4wuvnFH/k
	F005Q2WFOFX5B9QaWjLkhqa6POXmemBxv61UPKgQwxmumHBj46EhbaQfWNa8doqPrQiMO6EvDbe
	JZZcZkxwv+77GiOJpIKsPmzTCphd/DrrwbV8heBIgMzb7uKJzvk8mufgJe0oEwb8RdNAqDW12Ja
	MRSK8fq42ig/U1uqn4CsrK+l0iV6qh6+53gb3nf/sFe0p4SIM1jm9J+CckWIFupIrizTFBmaNy2
	tcQCkMv7oe742ltPsVsDTzF7slk1NNFr5MowLX3XpEP0EDnIuDeTI6Zonrsoy1RrTsS68z6iReS
	euHLPr/O8xt3OYigsrB3QCixbyvepQRfN6rPOF
X-Received: by 2002:a5d:44c8:0:b0:45d:41e0:467b with SMTP id ffacd0b85a97d-460304edd03mr4778392f8f.3.1780668911802;
        Fri, 05 Jun 2026 07:15:11 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f368e9fsm25521409f8f.37.2026.06.05.07.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 07:15:11 -0700 (PDT)
Date: Fri, 5 Jun 2026 16:15:08 +0200
From: Petr Mladek <pmladek@suse.com>
To: sashiko-reviews@lists.linux.dev
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Jiri Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
	Shuah Khan <shuah@kernel.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	linux-kselftest@vger.kernel.org, marcos@mpdesouza.com,
	live-patching@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] selftests: livepatch: Remove leftover modules when a
 testcase fails
Message-ID: <aiLZ7BjO6mu7eydP@pathway.suse.cz>
References: <20260524-livepatch-unload-on-fail-v1-2-7465de7f741d@suse.com>
 <20260525000622.3D4551F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525000622.3D4551F000E9@smtp.kernel.org>

On Mon 2026-05-25 00:06:21, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] The cleanup loop iterates over the TEST_MODS array in forward order, violating dependency requirements and causing rmmod to fail.
> - [Medium] Functions invoked during cleanup call die() on failure, prematurely aborting the EXIT trap and skipping pop_config().
> --
> 
> commit aafb48b2a54fe2209742378f31fb96583598557a
> Author: Marcos Paulo de Souza <mpdesouza@suse.com>
> 
> selftests: livepatch: Remove leftover modules when a testcase fails
> 
> This commit introduces a cleanup mechanism for livepatch selftests that
> tracks loaded modules and attempts to remove them if a test fails or exits
> prematurely. It uses a TEST_MODS array to keep track of dependencies and
> unloads the remaining modules during an EXIT trap.
> 
> > diff --git a/tools/testing/selftests/livepatch/functions.sh b/tools/testing/selftests/livepatch/functions.sh
> > index 3ec0b7962fc5c..25f1370038654 100644
> > --- a/tools/testing/selftests/livepatch/functions.sh
> > +++ b/tools/testing/selftests/livepatch/functions.sh
> [ ... ]
> > @@ -125,6 +127,14 @@ function set_ftrace_enabled() {
> >  }
> >  
> >  function cleanup() {
> > +	# Remove leftover modules in reverse order to handle dependencies
> > +	for mod_item in "${TEST_MODS[@]}"; do
> 
> [Severity: Medium]
> Does this loop actually iterate in reverse order?
> 
> The comment states the modules will be removed in reverse order to handle
> dependencies, but ${TEST_MODS[@]} expands the array in ascending index
> order.
> 
> Because dependent modules (like livepatches) are loaded after their base
> modules, iterating in forward order will attempt to unload the base modules
> first. This would likely cause rmmod to fail with a module in use error.

The ordering should not be important. It does not matter whether the
livepatch or livepatched module is removed first. And only one
livepatch is enabled when atomic replace is used.

I believe that the ordering does not matter even when more livepatches
are enabled and the atomic replace is not used. Anyway, there is
an idea to make the no-replace livepatches trully independent,
see
https://lore.kernel.org/r/20260529034542.68766-1-laoar.shao@gmail.com

I would personally ignore the ordering here.

Best Regards,
Petr
