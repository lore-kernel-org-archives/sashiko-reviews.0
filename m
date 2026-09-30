Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA4F50E587
	for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 14:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777519; cv=none; b=WapL53+Pxu/1talAJ/u/eIdV4mAPSkhLvN9fDefVOx8CqjEZ9nIVBA60gMqdxjXJ90vEQ42bYzqiCUr7JLZXsAfomnCVJaegR2/2G8tvRqTj7J0sKAD1znr7BxOKhu3B28XceHD7VQFjCBi3Ju+8KpXgZJRPBsfa96TrcmZB8VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777519; c=relaxed/simple;
	bh=j35vEpIPMoY28tuw8z89btjkr+NCLOZ/6D4QTxytxCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FRhPqsHXkD7N6FGaIwPPioIk8/ZiyreoHCwDH+rUBWnoLJAOLao4IDto6LBv8aETryGyg+xBrNw1ZzkxYmUHxSAbgKDmf2zH+NGrRPhQZhcxAErJKMfpF+MVXSXnfeXbV4vkQA/Ebq9BbGt8V2UX6jOyW9piE8d1fb6GMUfOfKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lu3CR2E+; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lu3CR2E+"
Received: by mail-pz2-f38.google.com with SMTP id d2e1a72fcca58-881d9da69b1so1331632b3a.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 07:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790777498; x=1791382298; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZD5Wk2pVEzvLwEM+dw1Nh8s2zTNtUbkNWimSe6i9Hnc=;
        b=Lu3CR2E+16SFopxLh9R9SMHCiU5sKo/DBSE2trZzrVvNaYSA4J5fa+c6mwlaYWxJC7
         dKYPTIcQEApFr5evUY0G7FPGw8iagnNZ18NmIjt2wIJD+zWQR4XAmNjwJSlJnwfzIXaS
         qRb59WXSu5Wfdi/b4q93wAntzEkmXrME+byEMbQrO7YQO5xEsvnqrBkdtETb8f2kGvoM
         wilm3jUL3y/IlE4Pxpj1OFFvbmGi4Oh6F/7RZNcrfwHjTztxyi6BYoyyDUTtvrAomqPm
         7uNJgg+rae6UZB3odNi3Taewwqy9572KZ6gVmUAYEQUu6cN7zSrUt8Jzos7KNZcD4qo7
         2KvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790777498; x=1791382298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZD5Wk2pVEzvLwEM+dw1Nh8s2zTNtUbkNWimSe6i9Hnc=;
        b=KBAhHV30JQi6On8mrExiDxMPjqCzR3ak2N+4PcSZonEdOicbOAc5zV4VbynoYuKLKB
         RubA+bDPQB4Coeh1qoxb0ZyrAFpl8VjJkTjIm1iQFNVJwT8MlQteYR6E6xfAhW1NfVsX
         fQbdtPeC2tdsw5iRhAN0UKsAV+dkZEFutbMT6qZS18UacQQ+ezFsLKczbJsncvGRRCHh
         TC1dOmm/z2v4d0+y/h6NqtWFbK7shT1RrzQSv8r3Pfk1D12BH2fO08NpxGxNOsbMk+vu
         zyk6RV6aUOKuRwznCryb9qJ7QUa77Gxy/EsZAPk5YVE/SVT+9JdzksR4l3gnWIV0oypN
         sL/g==
X-Forwarded-Encrypted: i=1; AKwUvBwsIIKYpVWa+T3e1eJ1flPI6/93lI5Rb3a//YEWep1MYCTxllNjCFPGbyvO29sAqoHl9Ek1cgDMTH2QkS+fNJY=@lists.linux.dev
X-Gm-Message-State: AFuF++mNg+j/JRnCrloXiT7vCPaCgOMQkrd/Hz949FMjBPd8gKMD6/os
	+xNBugwEgA9IlKvDhi9r2XwF1QOmyqS7AmPgrfZ1wmWUKI9agQflLKjU
X-Gm-Gg: AYBFou3gB7ipZo4BoYc9hpNr53ORWfKU9ojXtc51N1Dsee6eAiPJd0d27x5opPFWldo
	OQ91toQ04pQ+nWroIeGLG+l7VC6WIceHk4YTKcqasT4uCgjobQRYcRnoPQnTIQceULCKGMbk0By
	+YiErR0jGjd8Veo1YslZh+pyK+qvsbd1oRoRw61K8dxJ+tRFFDsnyIop/ri4F9Qa586cDKoajmr
	nXblNc2e3m3Lf6oja012p2/2hk+gFht7ad7ki2GyfkfT5tW+rk6hWs9Dne7JfcdkoKWUwRSYgLs
	LQoQ750YJ4i1pLYtmPcX4CrOwNrLQK4RQa6Uq+S6Dt2T9dXazy/LjjLLHqbhH5WoCpIdsD1Sla2
	l9B91cp83Apm+3snprSEIFyl+vjUKQ9ZBsEKZZZFHxTVBOkVPd0WXQFW8vddzi2p/apPgMEppOa
	pNypY2kbXv5fKjV4cJ0SaSshEw358kAcMvwX91mzoiAKhKDsDGJKWvaqGH6peKbLM8hUvyx7Vta
	MP5xRtpx9kLADtTQbXVNy70CPTzZIxGIiisVg4GgZl6roXgPUp78g8lESmnom8Q094qq1PVZw==
X-Received: by 2002:a05:6a00:1d93:b0:87c:9094:b72d with SMTP id d2e1a72fcca58-8874980140dmr1107172b3a.6.1790777497986;
        Wed, 30 Sep 2026 07:11:37 -0700 (PDT)
Received: from lima-arm64-dev.hitronhub.home (180-176-144-38.dynamic.kbronet.com.tw. [180.176.144.38])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88726c0c243sm916905b3a.58.2026.09.30.07.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:11:37 -0700 (PDT)
From: Harry Hsu <x90613@gmail.com>
To: mbenes@suse.cz,
	pmladek@suse.com
Cc: jikos@kernel.org,
	joe.lawrence@redhat.com,
	jpoimboe@kernel.org,
	linux-kernel@vger.kernel.org,
	live-patching@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	shuah@kernel.org,
	song@kernel.org,
	x90613@gmail.com
Subject: Re: [PATCH v4 1/3] livepatch: Fail object initialization on duplicate patched function
Date: Wed, 30 Sep 2026 22:11:32 +0800
Message-ID: <20260930141132.373715-1-x90613@gmail.com>
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

Thanks for catching this.

I've updated the duplicate-address check in klp_init_object_loaded() to
only reject the pair when both klp_funcs are nops:

    if (prev_func->old_func == func->old_func) {
            if (prev_func->nop && func->nop)
                    continue;
            pr_err(...);
            return -EINVAL;
    }

nops added by klp_add_nops() for two replaced aliases are
interchangeable. Both just fall through to the original function, so
allowing that combination fixes exactly the scenario you described: an
atomic replace patch that inherits nops for __do_sys_fork and
__x64_sys_fork from two separate previous patches will now load fine.

The check still rejects two non-nop funcs that resolve to the same
address, since that's still genuinely ambiguous. It also still rejects
a non-nop func colliding with an auto-generated nop for its alias.
klp_add_nops() always appends nops after the explicitly-listed funcs,
and klp_patch_func() always pushes new entries onto the head of
ops->func_stack, so allowing that combination would let the nop
silently land on top and disable the real replacement instead of
failing loudly.

Petr, do you have any further changes on your side for this series?
And once this fix gets an Ack, would you like me to send v5, or would
it be more convenient for you to fold my commit in and send it
together with yours? Happy to go either way, just let me know what
works best for you.

Harry
