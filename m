Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB0F3F5BE4
	for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 10:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787653343; cv=none; b=FJeoOTpABgOyNXBVVbJKG7yCdQ1AraUsrSaZ1F0jLsjHXqVAi3VJx5lVXHZWcUPzxgJzVMt19P0cEHOQIlPLlnRAUYGZ7b5mm7vVpy+jwn16c4kMzzjSLXP4hotBobAsYMvuHWvuTB6eUJ27xzJ0aribpapiynMeUs9IPftzNb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787653343; c=relaxed/simple;
	bh=bpyMKPh7/3WNSBuz427KUcFcISOpmmmELcZwiaD6o4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l4/HoaRuiKcOGf4IOLgqRdqdq8DVrnhQbYMwb1KnuwFajXoBDtR8ngX4n3RHvcFEbStSkgP/e1RulWaxqVudOHo8jfTOAGUpYob3OVsQd9HXLX4J7FW+sYpmm1b39V37VvgNPgleGdq7rHnHYgMzunhla1MQgO40hsE5pVWyMPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WKLR/0vc; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WKLR/0vc"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c96b08cdd1cso3769189a12.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 03:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787653342; x=1788258142; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/gUh7XFtmJKxfjCV7HF7ELVXykDcyipXT3K2LjOMcIo=;
        b=WKLR/0vcIMXvpwPEvhrGHTh4E98oZ6JHH0/Ci0HdeCRv6bEoSLTxEpuwH3e8DALsTy
         LLSerTiTlZxId/vEp3g0MYZdkA7fL0PvSCIGclMbIX2FT2XIUw6KsT0AL6aZdigauTDv
         rMDMX+tHi6nIjQ1esAIb8JZFrv3qBR1Xd//BdTRW36ifDdE2ux1w/odsg+x9igIEeBHw
         ZK2UXuVHkLzybw9JSyF2ZxpgUysZ0Nb/pu0CYJsV/9PyKyDf2OdZvFMIrcrXO7kP0arl
         a1UPAIB9pSNklZMCz4JD8Qku9Ad9V+C7zY3jA6O+cLb3zGewQuGb+5AJdpFe3B0I2f7j
         nHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787653342; x=1788258142;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/gUh7XFtmJKxfjCV7HF7ELVXykDcyipXT3K2LjOMcIo=;
        b=f8WdnkBIU4HF3MP9KC0cNNk5pzrO+/NhMkyt249J7AYSzFvrimvMNFTy/Abu3+K1WR
         OlVnKMMfO64o6OsTZufj7GtBLRj9Qg6LXwwRPcofaVjv5Omi4q2RJueXsmtOuX8hQCT6
         ARdr4j/SntgmLKOFfoRyldMWu/iMeKn1U6X3JEpUGsLDsDztg5gMgTAuePM/foYZ3uvv
         g55e3GtCUQ6G028m49o47lhcNd/gsMGi8rjSxPLS8TMMid5rOuFxoMzT5dNNuxfC9fSQ
         gn7ClysklNGKLhUz3rrcQitaBnZw77QQKvEUe2Bl4JSpycbd38y+2bEn+wn4AJAa7NkO
         Kmyg==
X-Gm-Message-State: AFuF++lgsy2qkB6pyLd8dTKSfkcoZNktEBIe4cvlNxC+e84Ejjpd1qNv
	JZh1qlZgDeV6GgQUyQ8rFvQNw6OQlSGfkk26D3i3xEWHCN+sZWKcIvnqzfBNGQ==
X-Gm-Gg: AR+sD12nqcstyWhtus9oLgbKoI6VGKQDkraSZoOtZaczdShAeos0F39CzbWRaBsMd1u
	xxyIpLeieI7uW/l++OKnRoZEorMXXJrZStYHBT5eCRB2FRZufSEy9BqQLeVIvrtmS302n/xtOKa
	ptsdsScR4yt9S8aegBpG6klC/Yd+v2t2UWBqYtPd4plkVHZbQWncuLyrZQLGMIEv7bh6bwO7co0
	gO9Nlca85v1oc43gZlgWnxUgNzN96L0e2dGMKWoMvpY+v7/Z4FbgZFDel7blYs40w/tyfSnxeLc
	Ms7Z6yer62E8DBNxaT1nvHjpmX0Fk05udDppltKZfRbWZXvCGtFGGSA8dbcRCDa/7ya4gkOL1Rs
	2CHgia1KxHYM8ujJ1c0WJLR2LkqrlkYNgf2z31A1IEd65ZnUCFR6lBUL2unbNT5iKQulGbSRaVm
	WfTnaZodMoaF5IpsHKMoPPYSAc9LUY3dPavy3Fo678tjALfEaKyBBDNoHwm7Oxg+d+vPrF4b3zG
	R/nAuxgfyZ/Kl+z1/U65tA+
X-Received: by 2002:a17:90a:d605:b0:38e:5964:97a8 with SMTP id 98e67ed59e1d1-395df5e8fefmr48118718a91.16.1787653341676;
        Tue, 25 Aug 2026 03:22:21 -0700 (PDT)
Received: from localhost.localdomain ([103.120.31.178])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f923615asm35567646eec.29.2026.08.25.03.22.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 25 Aug 2026 03:22:21 -0700 (PDT)
From: Khawar Ahemad <ahemadkhawar123@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org,
	jiayuan.chen@linux.dev
Subject: Re: [PATCH bpf-next v6 1/4] bpf: Add a sleepable page allocator for map memory
Date: Tue, 25 Aug 2026 15:52:15 +0530
Message-ID: <20260825102215.83662-1-ahemadkhawar123@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260825094955.83240-2-ahemadkhawar123@gmail.com>
References: <20260825094955.83240-2-ahemadkhawar123@gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Thanks for the careful review. After tracing the call path in full,
this finding is a false positive. Here is the evidence:

alloc_pages_nolock() is implemented as alloc_frozen_pages_nolock_noprof()
in mm/page_alloc.c. Regardless of which gfp_flags the caller passes, the
implementation unconditionally ORs in __GFP_ZERO before calling
get_page_from_freelist():

  /* mm/page_alloc.c, alloc_frozen_pages_nolock_noprof() */
  gfp_t alloc_gfp = __GFP_NOWARN | __GFP_ZERO | __GFP_NOMEMALLOC | __GFP_COMP
                  | gfp_flags;

The comment at that exact site makes the intent explicit:

  "Specify __GFP_ZERO to make sure that call to kmsan_alloc_page() below
   is safe in any context. Also zeroing the page is mandatory for
   BPF use cases."

So even though __bpf_alloc_page() passes only __GFP_ACCOUNT to
alloc_pages_nolock(), the allocator enforces __GFP_ZERO unconditionally.
The returned page is always zeroed before being handed to the caller.
There is no path through which uninitialized kernel memory can be mapped
into a BPF arena.

The API documentation in include/linux/gfp.h also states that
__GFP_ACCOUNT is the only caller-supplied flag alloc_pages_nolock()
accepts, precisely because the implementation controls all others itself.

No code change is needed.

Khawar Ahemad <ahemadkhawar123@gmail.com>
