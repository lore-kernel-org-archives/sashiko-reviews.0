Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4C92F260C
	for <sashiko-reviews@lists.linux.dev>; Sun,  4 Oct 2026 09:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791107346; cv=none; b=rz/gY/0+7L9ppCDLTPGCZxcsNOUGt0CgC0bsIBsBVpKcS6K2+PRYD9qOobNgAwDLuY5qSd/rE2dBd1iuAuEH1sHVFoeuabogR3qhQMGNTCZftmfsB7C8kBsrAZJLQZW0yXAxo91hlxpJVPlMFc0bmBPLDE+Zc5dhH33Vb56nAps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791107346; c=relaxed/simple;
	bh=ykUND7+mWwQH15b088ZPOHKV33z4sOLmTy51vjvLY9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kH/STaZehywRwEIZsxlOa4kcYw4YR+WCdAYrVgeHHTjq8zPj6D9ghBZ/QMLSlpgLebbsE1Hvmm0rKyfMzSKsla1xX4sGjzb+87DDreAS6Kgcgguzu6QWZfn7lhVSpgxcOrprOlgjk1tt+a0xMwszIbXOyovkDhbftQGUQO43cFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m77I8QNK; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m77I8QNK"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-149241d04f5so868973c88.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 04 Oct 2026 02:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791107344; x=1791712144; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0mb/xR5eRFy3O59ezfi15bus74aOTFozmcjdhnt60XY=;
        b=m77I8QNKPH+1UCEgerhn8HsUvSXrtJaoz0S5GTkNVinaI0TREiJhKkj+YaTZPCz+to
         oCncJHj8j9l84gJ6CKy8vJr5cad03SgEYArrraxFGpuROhOpIfTtJ3sXi3vtyY4IP2Xl
         U6s9N2ylxtyfkgIX72VCUoQfZ3gg0Gj089sAbxoAGsa3sosZrdNPu1Wv9Dwio6zEeeTD
         YfXsnqvgNp4RGH4Y0F73Dq2SaPdgUpPt2m+faQxe/Nh4bp04+ZLyN0rft3nGPNCb/5Fk
         a9/CI74gCfPM4HxgvB6QAjspjmjIVBXd3halpTxZ25eep9aoL5zvZGuTSvgbyjW0ZMhz
         /XWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791107344; x=1791712144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0mb/xR5eRFy3O59ezfi15bus74aOTFozmcjdhnt60XY=;
        b=hWeXDxMD8vUILuCzVD45Epk9tQymA+W7nL+cLwR3UCzkzztIQGn+wQ9Iw3+Glp3tjZ
         WfasQi0xaj7JTD3cmRpFntnOD3qbi9mk4MZKVReoeGJPxKM7w+IqzxwUbfUscycWC7tv
         Q506pJLhki4djKxFdza2plnbDi79Csr3RGLqKCKnt8xE3btpg3JZaTTygFKcUlORPOJa
         k+2QZnA22LCOQtfmm50tEX/IDfP6XmEBiN+dxvAf1YNGOVDcAYT5osIEbfedgAVZqIKq
         d/eeyntIph1Bnb7ib2w6LQBFbzQ03KVe260z0RHfvCcT87eTAP66BITDBv2mI5yDAhR0
         jxGw==
X-Gm-Message-State: AFuF++nssbKl6Qg11G3rshwYKZFnCAorJG+zROxbtMruB38L8yx4Jdc+
	p2oUfk4tVIeBJ3W2gF7hbW7991CJ4eBDhLUVrriM0BTIrLBcTngWW8gQTzHbty4aRnC7Rg==
X-Gm-Gg: AYBFou3EnlpxusIkxUZvgJ/nHukdDC3mV2oJ3d33Mq3ZvWTRk84C+RcBpwRrK7Y1Xeb
	Kg+1VuXMba3cvrNCwvHYjeFvFW5o1TK8jAvjsxdfwnnlsk+uiWdhCQ1VR1lwYas7/PpoK3J20OM
	exlFn21nQvCNyVFCcmZziodcwNWEZvo7dZG3pWhiJwNC7ZI2QvXmtTBisXu9akyvZ1FphbE4SC8
	z8QpNz4AzBhJJie3SxmzL77HtmxSslJ+UyFLAlrVk6wz4ml6Vzlliv1dENW6BXvMUPdiwodfJwA
	NAo40qyqW3Olq/mQj8gdohydfi8jDWW2ypQ/bdLHydNHle/q06BLf5uXPHmNC7EMUtc3ItaaVXy
	LDQC+lsT4R49Qtf18cQzG3nqN/9fUFNYxVaHuXClWLCH6ioDp1zKpAQonYAhsU4tsovSYrTQpEr
	Wveu5GGzOngMRxoGxBMFSac/jdr4qSb96fQ3Y8aJcIi2GFInhy0QnpNDXa9VOHII6kTOGQzMFc5
	EKAUP2dEAvgG1SSuKcQu34c/epxxkWlHh4OJlVRaqRfmyKE4vxEs7P9MnbcLrnZSpFAae55oQWr
	XfitI2M6K2DKDv5eD35T3S+UxrYc/0V26bFVJAdMyeKxjz6osJgAmrkW134=
X-Received: by 2002:a05:701b:4552:10b0:137:5b9d:cf87 with SMTP id a92af1059eb24-151be1472c2mr5904637c88.0.1791107343946;
        Sun, 04 Oct 2026 02:49:03 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fc39a7d1sm11321647c88.3.2026.10.04.02.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 02:49:03 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915: look up shmem folios by index for writeback
Date: Sun,  4 Oct 2026 17:49:00 +0800
Message-ID: <20261004094900.174818-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261002091439.59C611F00899@smtp.kernel.org>
References: <20261002073107.2209644-1-matthias.goergens@gmail.com> <20261002091439.59C611F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks, good catch.  v2 looks the folios up in batches with
filemap_get_folios() and calls cond_resched() between batches:
https://lore.kernel.org/all/20261004094827.174193-1-matthias.goergens@gmail.com/
