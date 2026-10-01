Received: from mail-pj2-f34.google.com (mail-pj2-f34.google.com [74.125.227.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E827B367F4A
	for <sashiko-reviews@lists.linux.dev>; Thu,  1 Oct 2026 04:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790829155; cv=none; b=rrONS5LX0iQA6jbpaQf75pTUBT32pzQtof32ccCNF1d7iiEZC1x/YNVb9S6/kJb+2c/AlLTl/cum7cTg0le8Tesy/pi7kKl3FzsINrCkDQGwtzGS/R9oaIsaN0WYvXFnU7gOG9fXAMq1oMSu8wf9+nma4lrtnYOnShRX5MH3GSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790829155; c=relaxed/simple;
	bh=2cdXcBFEwI3jjzLipmLP0911D2tzhGvFyo2oGd1W+H4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XBKJFAt4w9XEYtGhd2ltPuMzmuzEg5s8M6hhQc3O1LSGWFK5NlsYDMYGwG9gshIcKKmikq6fOKCOLTZ1g0hy93D8YRzhGMqONDeXJKRkT4XeHsjDI58DZQH1dQ3zOnGYVMRIrROT+4JHCeNFJ4CNtsNZPRbxXKOkPCq8kMy0DeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KgmRFQyx; arc=none smtp.client-ip=74.125.227.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KgmRFQyx"
Received: by mail-pj2-f34.google.com with SMTP id d9443c01a7336-2d747eb79f7so27375635ad.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 21:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790829153; x=1791433953; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=elrhZUFLcXcRp6X3/p8YCNVRVzWhHBdMXnMivKI+qJc=;
        b=KgmRFQyxN3WQLt6ZPaiI5xwPiPq49j01/v7mN5KyuRDUj5i31wYxbZUe7DSvEnHMXy
         MhRkUvQyMP+uHw7VLTDrhhDnPbihgqByqrYyvGcYQlHMjyBjFUe42QHWIfjx9HnhPvdV
         GpmW3N8hFJragqfG1QQvAF9ymQ051gs27QeZQ33VnrSeZfOg46D/rxTdVZhWWj6yn5CH
         4guvQT+/FRlRuY0IryxjFR7ev7S/rsyIQd0IHU4/50Yr+Dz+pkvbWxhQo71gmOF15cEU
         q20561AWWnzKc5iduk0sahIEiNeifPMkvHAVMp8UesEvrKf+a2Z0IWFuWU6MpqxOf3fe
         AmxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790829153; x=1791433953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=elrhZUFLcXcRp6X3/p8YCNVRVzWhHBdMXnMivKI+qJc=;
        b=qPmce8GBP7+ooqg4qyJUi1hRfZyNRpicVD/LC0ahhch/re2iuXvg1veu+weyrsQIta
         /X2MlmXdWrGfsv9+Rx2AEhXHatpGUbEzyKumLR4lf7ceLfTX4MmmIdZ+o0lr/i0lWgTR
         CqJjIYtcsQV93oY8Hb61HYVhPw1s+Fn1/YPgWKmsz1MozLn1d6Q+9M2J/wBoobxWXmaa
         cgwo2tACKc4BjpIdVzJkczuYw48KReY+IDK4dMpAACjAGb50ramB5VlUMuvR8UofxGlC
         n/oDvXy1b7MHBkNPDW7mqPwuys23F0evqAJAuW9JzOOhuCKLtxlt5HyISed9B8OY14Ez
         SgLA==
X-Forwarded-Encrypted: i=1; AKwUvByCg3Yi8BUcV2LnQkYPOXnEGxoBY6N0f2YhteWda/psuw00jEPg02EmM010lx7m2tmrzwSKJsoYxDsueLXlcXY=@lists.linux.dev
X-Gm-Message-State: AFq9FYJHPDOWTECowchqOgUPQSshTAmUT2Ws88HOVoVEQo/pYOJDDwVc
	gcSN6GP8POhU6NtkOYUfVagKAgyDpoWcrLP5ZSWQ98ysfhrk1YExoOfZ
X-Gm-Gg: AYBFou103oD7HxgkWusD5eFgso7/MZw9v/SHCI9ZIEF6WL1XV9rNfD5aBeefsZ7fSDU
	Z7pRB3I3Z5kclAMf6dbf+V5dvJv1YKg2dDLAzRdnLoIhB3kBHoFW/4exhOmc8OTIft8hWFNDamJ
	zgnTFrLHzIKKjhfJfNzZVpYjzQmHM2vT3n3G+4lhqAy8cnpN8aMfXux/nsTkn8YuCWbzxD2FKua
	fMeOXNLSmuzv+ezif4zktN/x3ekiiaMBjWjGst4qSoZz5KbZ9rucgbCHR8Xp8Y7RU/AjXsNlSRY
	96A2xQZTwXGY+764Seyt4Ah1IWAEzSihO5TSSmHTX7z6HI3yG9EX4BqAJBkto1HC+wiRnwyIfRp
	I57vQ79FQ5PTp75seB6FBa67X+6IApDCfC2Nr964/a/mYpuZwrSMKrBv0ijaEeP/jgME+9wqYgF
	BtF/IWfViju0MF6PHMSLnKIBsyGxUt5i6hmg//aWmXuTv+XAKi1CNeiB7tibrhzeqazRvK8S0qT
	zs9wm4uWUilVhLgIzF7LG12IL4B0Y8/ejs/VGybPOQjGReJcd7/DeGx4nrF0ZOuYT8sX50i7rQ=
X-Received: by 2002:a17:903:32c3:b0:2df:90d4:1188 with SMTP id d9443c01a7336-2e2e4939452mr28042805ad.7.1790829153200;
        Wed, 30 Sep 2026 21:32:33 -0700 (PDT)
Received: from lima-arm64-dev.hitronhub.home (180-176-144-38.dynamic.kbronet.com.tw. [180.176.144.38])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e300a90dc9sm4921885ad.18.2026.09.30.21.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 21:32:32 -0700 (PDT)
From: Harry Hsu <x90613@gmail.com>
To: mbenes@suse.cz
Cc: jikos@kernel.org,
	joe.lawrence@redhat.com,
	jpoimboe@kernel.org,
	linux-kernel@vger.kernel.org,
	live-patching@vger.kernel.org,
	pmladek@suse.com,
	sashiko-reviews@lists.linux.dev,
	shuah@kernel.org,
	song@kernel.org,
	x90613@gmail.com
Subject: Re: [PATCH v4 1/5] livepatch: Fail object initialization on duplicate patched function
Date: Thu,  1 Oct 2026 12:32:28 +0800
Message-ID: <20261001043228.74946-1-x90613@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <alpine.LSU.2.21.2609181452160.21788@pobox.suse.cz>
References: <alpine.LSU.2.21.2609181452160.21788@pobox.suse.cz>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 18 Sep 2026, Miroslav Benes wrote:

> Could we also check prev_func/func->nop in the check in
> klp_init_object_loaded() and have a pass if true?

Thanks for the suggestion.

Yes, I've updated the check to skip the pair when both klp_funcs are
nops. Two nops added by klp_add_nops() for replaced aliases are
interchangeable, so an atomic replace patch that inherits nops for
__do_sys_fork and __x64_sys_fork from two previous patches now loads
fine. A non-nop func colliding with a nop (or another non-nop func)
is still rejected, since the nop would land on top of the real
replacement on ops->func_stack and silently disable it.

The incremental change on top of v4 1/5 is:

--- a/kernel/livepatch/core.c
+++ b/kernel/livepatch/core.c
@@ -894,6 +894,8 @@ static int klp_init_object_loaded(struct klp_patch *patch,
 			if (prev_func == func)
 				break;
 			if (prev_func->old_func == func->old_func) {
+				if (prev_func->nop && func->nop)
+					continue;
 				pr_err("'%s' and '%s' resolve to the same address, aliased symbols are not supported\n",
 				       prev_func->old_name, func->old_name);
 				return -EINVAL;

If this direction looks good, I'll resend the series. Petr, should I
just bundle everything into a v5, or do you have changes on your side
that I should wait for?

P.S. Sorry for the second mail. I forgot to quote the message I was
replying to in my first one.

Harry
