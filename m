Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9E32D97A6
	for <sashiko-reviews@lists.linux.dev>; Sun, 28 Jun 2026 18:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782670971; cv=none; b=DcHBnoVarhKNFifua6u7HzJn+4qgo3OXSg4WLioZ2n3ENP6+ppZjsP1oa+iI/WP8sZrh2MzQrPqNSiRNor+TlaGPXTdFnqv0YrCEn0BVAiHOCMJrcX37TZCz3hjlSXCD0te5RUx7/OdHead82rrU9/c8S+d7DnnE97237rYpvyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782670971; c=relaxed/simple;
	bh=Z0DQ9dWZ2koMQA8ywoE0uWtSaYihQ0LX5J4USq5K1Kc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AXa61KMx/g+82kqncwP3UJfqW1stigkJiJ5noZvQ+hHOAkxCWUcs1Ru30hXa0wA/nYUJpq8owdLKgzZYlBhCgJRkvpyr5AfqRFX6FSyxWHra3rEI/G9bKDRqhNijuTlQVxXSpgf3lN2nucYJtum5UTD8DFSyIvdp56R0kigGFdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JygIFmjo; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JygIFmjo"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-37d70036426so1033218a91.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 28 Jun 2026 11:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782670969; x=1783275769; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z0DQ9dWZ2koMQA8ywoE0uWtSaYihQ0LX5J4USq5K1Kc=;
        b=JygIFmjovCFvbmuKUejeCytkGwXTlX/oDC3q45OjMYBA4bQvY9fhCp/2vJlPm09FAz
         JU7qrjmp2Vu0JHzF1daYiFBxorTNarOdKNLuofVwkSJkhdatgdDu9TSYWKpHUV6HbY7l
         is8T6Ii6yzSE6b7Nh1OLaG65KSrcTijbuCxDNA8B7HHUUNGF5c5XSxEvc8Yt2q4qOTl1
         Q7hjMhY+BsGPB996Q2vE8Y8w4oVclrB6RFVBudQHu7HMGUOw6QZV6yfSTvDMw6QjFQj5
         lbY8eqPsspbbQw4gMn8acwzPhI0avF72rQejy5fBxwnhR4mPvk6vl9mlYV/I7PijB5Pi
         Wz8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782670969; x=1783275769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z0DQ9dWZ2koMQA8ywoE0uWtSaYihQ0LX5J4USq5K1Kc=;
        b=ZBitWF71anSr5dodW6+E+2CUTTgDvgsP5IZD0mJtZi9hbt8pwp0wbfC+dJHdpIptuG
         UWy/50RskiL0U4SXRkdEJIcgIzzQlUZPWtDXoOqV7uNAjlj+9Qlh2TkSeYBuCdLFUBOF
         ytYLcSLP0/Udnl43Ay5intn9GUDbrkr2OKVEJQ1rcU54SUVxj90PtOyNrgR9VAGxLmJH
         giHWccU0lTGYfv/tm2KC9Glq0QEBJ8MvhK6UMQuYqU9j9rs7iIEoRBn4iEEu84MwLGQY
         hChRoPCmELrMpDWKbbfyfe10OKiAIjeJtGuJ6+mPGxIEGHvGy2fRFjNr7JLK5PPZVys9
         BHiw==
X-Gm-Message-State: AOJu0YxHwifzgd6p2QAefbF544rCl/W5JNmo39eKm25F37U5VTCz/ClJ
	pkt7cUPMc65pxjNOGbCYCRTVq5/eGe4A6NIceGM/4ivqFtxJyrGHaQVleuoF8A==
X-Gm-Gg: AfdE7ckJWw1e8AVosjwbKF+J2F+fWx4xxPrFn/3hqNaWDG9mOFj5eKKfJU2DoWz0iXo
	8VvufjZx32YckpItA76da7QXyy4rFHbQgM/d6XuL9HTTh5k8047GcbJXdtC84V+794qeHdYIO5V
	RhMsbIJWqdo93p3BVryD+qZ7GnmjpRqknKtinqVSug3DKnwt06Irw9KAdUPd9YQDADHkfTtzhK6
	L2ycQ2q2UGN6vK4gG32oaUsRG+Ya5IwKih2+clHVHWsGYDw0iGVA982P2hzrxs6LAJ5EhTPaarN
	sAIuS8KTcoisd1+g5fMvdENJKxIdaW27+o/sOxN2ZZ/1I6rWXPwlgIYiiX38OqRC5XaOlp4Ojtg
	MzpUZd7VTiIN+xm+pNJKWay3tX2VWZ2JZ+igikH3S9nV+5x89rOZsg6dJ387XMU0zTbYrK7FEjv
	fR/pFuqKkszGTuIqdTRlPXZ3P7QBogeyG6XsMRVAVtF86Uwet+yzdp2LbEjrMmpQhX7wkV/ioTf
	h/1bfLYNGDnKvT/EUaYSD7bRqEwFGK+NgVFqw==
X-Received: by 2002:a17:90a:da84:b0:37f:a915:1c29 with SMTP id 98e67ed59e1d1-37fa9151d83mr6068848a91.19.1782670969047;
        Sun, 28 Jun 2026 11:22:49 -0700 (PDT)
Received: from libra11 ([143.248.188.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37ffdc238c8sm781779a91.6.2026.06.28.11.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 11:22:48 -0700 (PDT)
From: SeungJong Ha <engineer.jjhama@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: ojeda@kernel.org,
	dri-devel@lists.freedesktop.org,
	acourbot@nvidia.com,
	dakr@kernel.org,
	rust-for-linux@vger.kernel.org,
	nova-gpu@lists.linux.dev,
	SeungJong Ha <engineer.jjhama@gmail.com>
Subject: Re: [PATCH RFC 4/4] gpu: nova-core: gsp: convert GspMem to zerocopy via the transmute bridge
Date: Sun, 28 Jun 2026 18:21:54 +0000
Message-ID: <20260628182154.712621-1-engineer.jjhama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628172200.B116D1F000E9@smtp.kernel.org>
References: <20260628-dma-zerocopy-bridge-v1-0-9a2895ebe30d@gmail.com> <20260628-dma-zerocopy-bridge-v1-4-9a2895ebe30d@gmail.com> <20260628172200.B116D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is pre-existing and not changed by this patch: it only makes
explicit (via a checked `zerocopy` derive) what the previous `unsafe
impl transmute::{FromBytes, AsBytes}` already allowed implicitly -- the
layout is byte-identical and the message-handling path is untouched -- so
it neither introduces nor addresses this. I'm not familiar enough with
the GSP threat model to judge whether the TOCTOU is in scope here; if it
is worth noting, I can add a TODO comment near the affected reads.
