Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDA92C2360
	for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 13:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780059882; cv=none; b=kzqgYkt3RdXvj/uYz9KDkxRBxgkct8VFF5qBHe31Yv7ZyDf2sDkFWzuZfq3fQMx11cm2Xc6Vvc8E1hynxfkhcDl7vPW0HU7WNPWgo94JMZax8WDRiYNd4vzYhGTaYUuze8Ca4/efuGdWuxw3pM6h6/c57+xuur4k2qme8jdUdpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780059882; c=relaxed/simple;
	bh=H1B+xAqwXLNNuThmDhrS/L/FvBoP1ll4glIpB83aMlo=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=JMHQWrvUjk1VzDmsWEoT62pkJzGHd6ytqQH+jQudhcFXBmPb30oH2rwnZ52XwC1QLpn+TNLQA+lyLSuNdLHRCJYr0b5RodJ084ItEUjCTeeVwX5WnjzDyutmhKEwOWC04+2DNquNrk2lkXsLPlo4gufHh8xi+aEzCRW+KSBsQRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=enTgqrIl; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="enTgqrIl"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36bb3551f6eso963776a91.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 06:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780059881; x=1780664681; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cSA8t19jfeD/ffTmYuzFt48kJrYE+ahUE1aM38C/r4M=;
        b=enTgqrIlAnFLM/Gh/QNrz12epTXybW9u+elfnMolTfOwTSi+Y7CqLoxRWMi3aCfNyH
         KSu6xq2XScmKkgPDW/DonEC1sWooUmNV69YF1LILSuwL4DAIPPTY9RXl42UzaGEqN97h
         0LmiVjdamvBYijqQjZHmgD93TVwBZkcGlGU5V7MUI6qtqRnWYkSdpKgt0GlQUihrPwyF
         meIpWFsBOjRVeQazr1pUXVgDF+a3f6dfj4SWOHwya0P8zPfPwvaZriqMmPVCsWFhKQ0o
         +qaIqFca9y+ZP1iGiW1hQPQmyA7/75SRS0QaUoi4kL54k3RwbbJMqFEAxPJBiiAmKsqq
         MLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780059881; x=1780664681;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cSA8t19jfeD/ffTmYuzFt48kJrYE+ahUE1aM38C/r4M=;
        b=KNoRB+JM/Y29bxHx0iWLSggU0bs23EUQT2+hZVuwyQl1sSOffRW37Xg+tjZYrCdvOj
         sO7cBpZ8h6SEIWKB3XqelkGl8r8R0TeqOGpdDbe8qpA7uyuvsN99PAZjgRSpWz2cu/9O
         HPyyIEwGgBvUrbtsnwLACD2qu+mb5up3Y0DxZpurLMk0AuIXkCKEtbivAQeQkaPbO5iW
         QSnNoLidW8ilEYQSkVL0NuTLbnlcZ+OtxGMx5WzmwE3KtJdyjVKceOgdml4eGH3cP+J8
         ZVZ4QFmQ+2em/mUQxNZMXl33OM4Sxvu2A9uEf135NiRgaSR8+YBXdo9+8rTcMHBdpUEF
         /1LA==
X-Forwarded-Encrypted: i=1; AFNElJ/2XhkJYA6GCDq8p6prEG9UMy/4oVBBxrbtwkbHS4LMRDn/mwxHPC2KfyzKok0dot5Vq1JTXlqqd9p8kc1bGoI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyxdTPhzPt4DyoJaM6oLPNUGDa2xZNNhxVEGkbWih0B8mSyJJHa
	IktoLYsd2DbDk251NO02D58DVK7KaWbrBEMe6QJ2C55bLN5lpgxzxfq0
X-Gm-Gg: Acq92OGT8WCieXAoSSdFl6UbrOHSH30J0FMKPK5fPYYEvyqH3inyOP7Ie8z6iM4QK+C
	VMyKwGcA/weDVOf6joqDbbu0eUnE9SSl6VgMtmYHoCWH472b0bOkrpvWCrNQCkyGmENRNcC3SNy
	IFM9m/GYnsxJVq4Fjeke861FXdzitIfsONTRcuCe4tId8DjES7+2+Zn3Q4lOq555Qi9c9EjC3Kb
	0SCCjAi5ZSO5NoEvDJ/Wz0AoINAj+J1Esa51pOFSc8QbKn5rgJEcWnG815j8NgooSg/92dk+Ljp
	o1F7e1QeCyeKW215Xv7KXvVxnjIsEhVson7kwNE9GCtySawapraibjN7lzGkWt1dpE660K7wedQ
	i5QhdV7RMcG9ZxHyqnVrvn/ANxLKNpA7dJTKCpirW/O74NyhfCvAkQjH+LmNsMdhdMZeMSkI74L
	CJP+6LMrxKlBmcHdH8PCsNFUJQK145X74cHnX0HMVLmGbxSnShUjqZ+577M5iSEa+Vt0qOYRtzp
	p2u
X-Received: by 2002:a17:90b:2c8d:b0:36b:afa0:c675 with SMTP id 98e67ed59e1d1-36bbcfdbf27mr3443848a91.26.1780059880841;
        Fri, 29 May 2026 06:04:40 -0700 (PDT)
Received: from ?IPV6:240e:39b:ee1:f550:8519:8be4:eab7:7536? ([240e:39b:ee1:f550:8519:8be4:eab7:7536])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc0c341dasm2283157a91.15.2026.05.29.06.04.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 06:04:40 -0700 (PDT)
Message-ID: <1329d626-01ac-4de6-a4ae-51432d7bdc93@gmail.com>
Date: Fri, 29 May 2026 21:04:36 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: sashiko-bot@kernel.org
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, liem16213@gmail.com,
 sashiko-reviews@lists.linux.dev
References: <20260527172255.443CE1F000E9@smtp.kernel.org>
Subject: Re: [PATCH] i2c: imx: Switch to new reg_target/unreg_target callbacks
Content-Language: en-US
From: Liem <liem16213@gmail.com>
In-Reply-To: <20260527172255.443CE1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Subject: Re: [PATCH] i2c: imx: Switch to new reg_target/unreg_target 
callbacks

Hi Sashiko AI and all,

Thank you for the thorough review and for catching these issues.

Both the dangling pointer on pm_runtime_resume_and_get() failure in
i2c_imx_reg_target() and the missing lock/timer cancellation in
i2c_imx_unreg_target() are pre-existing problems that were already
present before this patch. My commit only renames the deprecated
function pointers and their implementations, without modifying any
of the underlying logic.

I agree these are real issues that should be fixed. I'll prepare a
separate follow-up patch to address them, keeping this first patch
focused solely on the terminology migration.

Thanks again,
Liem

