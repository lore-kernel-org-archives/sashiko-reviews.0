Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEEB4C7523
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 19:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790364775; cv=none; b=XSRWWJjkJFSIfqwzXLr8UKvrKoTK9cZCcaXmBQEmfFmDHrFkxLejMnjAUMLusFGz5F1WDjPJicCYP5wX18zzGilSbTnUEOtx8VmqYDy0imspfmf4tYXRUmjZZoRx5UKLfxAe/rrBb2kBDOIi8QzMZEcx0i+dD1JVNe7yCyyTzo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790364775; c=relaxed/simple;
	bh=K8K1S9ERuiSvvG6VKGDrUmZzsFAhSAuIeiifb6ecQio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZrXruQC1KHUPsIv8Agwh2SE4CvIdEK2ehaWVE36nZ1XEd/6lkv9luImN9Vvao7U3S8yFT4uP0a7tD1GJ1NKGu4ywi3v7dS4kGw3XmapAkK3JF1xRvkRF7ay/QzCNW1MS7TbV8G6s56qZqs9p7KRw0zkmOCscX0vecfM2aN5HpUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XDneOzHz; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XDneOzHz"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1801fso1407852e87.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 12:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790364769; x=1790969569; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K8K1S9ERuiSvvG6VKGDrUmZzsFAhSAuIeiifb6ecQio=;
        b=XDneOzHz3LecZ79tQxW8UjqFFY1aEZf1RrXy8dhrRRa470EldCCT0zlNAtHJx62rIq
         DqkI3fjFPuy1lwjDA65pyN93832FX29ugNPByoP1Eip9LNKM5/mjmBGN2rBL/+XK6/vE
         rUYxo2bFWERojC+WVoNDbYcccUzqcnTDuq4As6Ptcq8eCvhH0uIDNPV4GKLhGcEkRknG
         /NdeWDbhOkS4Dipkz3Ec4uiiZ9vOhnze+2Jrw3OM5PJiyHAgDXXJepfKHRmJzlezWEMp
         H/T/cwaxr8/qszMzEdNvr+5ERDNofm/wQkeszoO0vkHBr06kbSlvXiAKaoFGV9aFbN9M
         l8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790364769; x=1790969569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K8K1S9ERuiSvvG6VKGDrUmZzsFAhSAuIeiifb6ecQio=;
        b=JhndpZZQuiDB9IpMvw4F1W8J/JGTv4U+gv3XljQj6xTZdPs97QG5JPFbAamrn0++1Q
         gLTBC+HH2OOlKjqyoOCors5+myY+DTwsM7u4m1DZyCD9RtBtoOXexiPlHHs7zoYoeKhm
         pENdP/++BdiuXktIKV0v9CxIKqmW5sSLnpbBqu2rF/SQfTG7HTSl6vR/fEoOFoad4eNh
         ZhxEJjf5MCvNEsLKi9QbLRczJsFEobkuEExcRdWFB/B5jImzSNTAfve8vADcckE1MqUv
         QWNE5aYRypwt5Bj1rrMK6yxnhuH3OGu3h71jUi4wYlOHXwQUAsHjGLbgSIkk0G/ofkqR
         Y1IA==
X-Gm-Message-State: AFuF++n3RLVlN49No+vpbOuTeA/lSTIatgdJsaNJJ6p0H2X/UeECPmpU
	t9Ssgx1CT1NPIE6Is47T7Zbz3RqP3rwZxJIg/QAEoTso4dNkVoZoVarntT3vBixr1HAoyQ==
X-Gm-Gg: AYBFou1ZRIxQIs9eNdw0/p03EtPTZ1b6yMFCmLTAIKRAwbRiWKAOn4wAFPFimeJv0Lu
	VyCG3zubFS97IXOi1Topzc7SvB01Ws+E1xnmwIjlv+0UD3YD1zPsX5rUuQw9yy6MBeoTwQws+tp
	+IjgfOusDpzkcJIVLE5m7NXS8+b+ZTPlygd4B94l2GbR4Z/IcEnem2ZBHJaGnh/dWaZZgH5Jv92
	+hAIv7oZ7ib2EKwX+077agahqjZi8519EGkTAX1o/c6tHa7hdJJfhVpjdiF4awN0K7/eJL+0IaE
	Y9Jb9JM7YQRUjvbZn2wsd7VzuhLO84ci97tkqKpCv0phfum5qexN92qkiH6NIpitNe8ir0Zfjw4
	dj0hkrYSmY0jelmV7E5ztKOH7TlbqQv2TFTNX+8MOZ+XK7n3kOehYdMSyO033aFhNmnIskkJLKp
	GjUVXOKNSzgxdix1QPuoo5vveORFolo/zDjH/FORJWlSyLkRbngN6XeJCDGlGkPs+T2UvHq+d6A
	I3aYkjQYeFgwfc3
X-Received: by 2002:a05:6512:a87:b0:5b4:adb1:b25b with SMTP id 2adb3069b0e04-5b8df049ebbmr2324537e87.14.1790364768717;
        Fri, 25 Sep 2026 12:32:48 -0700 (PDT)
Received: from localhost.localdomain ([80.66.93.121])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8e6afe7dcsm778146e87.51.2026.09.25.12.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:32:48 -0700 (PDT)
From: Maxim Skokov <skokovmaksimevg@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org,
	Maxim Skokov <skokovmaksimevg@gmail.com>
Subject: Re: [PATCH bpf-next v2 2/2] selftests/bpf: Check that bpftool map dump fails for socket storage
Date: Fri, 25 Sep 2026 22:32:30 +0300
Message-ID: <20260925193235.48369-1-skokovmaksimevg@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260925162915.2CB261F000FF@smtp.kernel.org>
References: <20260925162031.27259-1-skokovmaksimevg@gmail.com> <20260925162031.27259-3-skokovmaksimevg@gmail.com> <20260925162915.2CB261F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Since the out label is positioned after unlink(PIN_PATH), the cleanup is
> bypassed on failure paths.
>
> Should the unlink be moved after the out label so the cleanup is always
> executed?

A failed pin creates nothing, and every check after a successful pin
falls through to the unlink, so no path leaves the map pinned. What is
left is a run killed after the pin: the stale pin then makes every later
run fail with EEXIST. Moving the unlink under the out label lets the
next failed run clear it, so I'll do that in the next version.
