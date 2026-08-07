Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9688B1C5D59
	for <sashiko-reviews@lists.linux.dev>; Fri,  7 Aug 2026 18:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786127960; cv=none; b=XPxAS8n1P9qfMru5V9TMwDCZl9gI2BoMXSHfEq7ut8jCizQnFSwWNynUjddE297jAhM9EJtGtSj2xs4B3S+XuEYZJez59QeLhn0EvTbSjMZpm5+sXOh+Pt4po2/EHzONuHxG0Vq6J/fXMbCNTmpesL7WXzRHVBePR+YRkpIantU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786127960; c=relaxed/simple;
	bh=1w3Nuu7MEgSLxDphoqxOiHIes6lwaCTQWCmIXRsJ1JI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hYGbPlv7Zjq5JukOfB8JP9wki8XrcDBxMtIaWX/heiKgJcSGSvXdH/a7Q9VU0uXXDp3LQ68ezB6VuF5WuLRvnnOZdfivYFwAioO4wIkX9IoG9XM/W/SMPvcqpggMi9qB/0RX5hF+i30hEh3YfxDPk90nciSdD8XfPPEkmniyAOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XdpD81hB; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XdpD81hB"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cc891373e0so46158385ad.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 07 Aug 2026 11:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786127959; x=1786732759; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1w3Nuu7MEgSLxDphoqxOiHIes6lwaCTQWCmIXRsJ1JI=;
        b=XdpD81hBz4T/PJ15OzYWC4mO3AJdYlYiOcyuZbg9Mq+Ispk9r6u+i/35JWpbWlMzpC
         YPOaJ5/xeFuiopnM+o3OqHFOnLeWKxbRHEmhcaL7TSQXFFpqhduKq2fQ0cTAXQPqlOog
         YqgFpme2pVd4wk6MHEPAMinYqfkx5IAF8vJ6gOtiIaGj38FCtMw6N+fowrnSScg+w/dP
         MXJlUvLRn/xGewEHMqa8WYPpfymGAXj/Rwr6L8xShNFvFFn2k1RRuTNy8qaAIBBFkNpF
         +1hdbqFTn6uxnJV1Epa1Ihvc3g4yG60jRbB7RHYt2jltyjF6HUCAcVvxbHjKB27EyoIX
         pdXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786127959; x=1786732759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1w3Nuu7MEgSLxDphoqxOiHIes6lwaCTQWCmIXRsJ1JI=;
        b=rec3J7D3NOVumg9c8DBbplu/SEkDbH73Pc6N4CpaW3uOAZHzqdzbPPT/LnDo8gsb91
         3NajLQrmngJXwl9UbvpS/TQgfNJar2wdJWs41/pgoKDrAPd6PpOzyf0Q6ovbhAopSbQx
         +XT0FqFJxlpequoiC+mDQUvaqsHK/XceBKGPnl/LSet6liY62XUGrxO5qLru3aYGqxcG
         ne1FpEwR0YstN9fTDTx3WZDqEwZybeJ1ftrkxcqheGY72TMk0EWfuyWgBCWQGWjBjSGB
         lWQx5lX4ERjBG0xCgAmndZYyuqDPNrbcirMgkZgYJupBXO7IrDTVguEstiUboMmiGQKJ
         6+LQ==
X-Forwarded-Encrypted: i=1; AHgh+RomQE29Rr5wnYWDscxqNB88QBlhlHsC4vYk6eqlD6354yO/hQ65U/X7btWYM533eV0iPCPNoHRuKddBZ1/gF28=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzv+nX3TqIB+76bokez+bSD5KVh3FxpTl6BUZytWEPjBfF17U4l
	1vcSTALK0qGU9ZSSGqly4xQlyghNqiamu5XhmVALa1iCBUXYmyRBLIWE
X-Gm-Gg: AR+sD11dXP6zIC4NW7ALVXyYeq0tK6UwbofatxSVWzXDNUXq0G8MTGFeVWuYFRTNQHD
	GcFn4xdWItGKoKYtlyF+u9IBW3n6LA4agZOsase5uP58ovCIhsnfGtFADm+7dSbBkR/SMe/ygqI
	FtlqIbekitaWp04o6cPcZqTy0DutwCWcG9F8XWUELu/OwlZjR4+m+R9hY7PVAcN9HDs0ovJgNQF
	loguocrtrpzBak7/Uwmkm8BH/ufIWUk8scWCRyV+rczt3/7XdChe47l2eAStLJa9LjhWdFN9MKM
	4/ieVHHGuMcmVDXeG+l5NOe/kIpFfsKZm7TkZMZ5s+QT8cQed28ezc1WXXisc1EUskVok6Cfbb1
	6+offsD/NY0LzGaUBiaoL4Qm22aPIDVMYP37Z+JeXfbRuFGW6c9rbrC1aswvl+DUOZYmldYCee9
	r49EBIqoMf2IAizZOzkz42KxHV1ib2DjEuX4rikScvbuU+4am6xFWBS3N+ySCZnzrGaNi5WfVKv
	mrcK/VcSpj+ubW2jib762iy+VB8YXkAWcpphUPL36fq1ZpWlO2ifdGWw+Rd
X-Received: by 2002:a05:6a21:e58b:b0:3a3:a9c4:3d60 with SMTP id adf61e73a8af0-3cb85f5c2b0mr30739753637.27.1786127958832;
        Fri, 07 Aug 2026 11:39:18 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::6868])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f37469esm1155243a12.23.2026.08.07.11.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 11:39:18 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: sashiko-bot@kernel.org,
	skunkolee@gmail.com
Cc: linux-scsi@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH] scsi: arcmsr: fix NULL deref on dma_alloc_coherent() failure in arcmsr_alloc_xor_buffer()
Date: Fri,  7 Aug 2026 12:39:04 -0600
Message-ID: <20260807183904.73546-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260807055056.9F05F1F000E9@smtp.kernel.org>
References: <20260807055056.9F05F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the review.

Now that I look at it, the commit message's claim about a reachable
secondary NULL deref via arcmsr_free_ccb_pool()/arcmsr_iop_confirm()
doesn't hold up: arcmsr_alloc_ccb_pool() failing sends arcmsr_probe()
straight to unmap_pci_region, bypassing the free_ccb_pool label
entirely, so that path isn't reachable here. The acb->xor_mega = 0
line is still harmless defensively, but my stated justification for
it was wrong. My apologies for the inaccuracy!

Separately, thanks for flagging the pre-existing DMA leak of
acb->dma_coherent (and the IO queue) when arcmsr_alloc_xor_buffer()
fails inside arcmsr_alloc_ccb_pool()! I'll follow up with a separate
patch addressing that.

ivy
