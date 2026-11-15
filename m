Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794735453;
	b=oB7Zc87lyw61NQdQlA9BvqeGvp2mwWJxIO+A9OX4wBlneg6IrvN3rpUvClwW+cTBo9oK
	 17cUJy3Cx/UJfhXBIcDxs3/4tpfZ6McS7y0LplbCZkxTowwPdXH+4w6b6oNK7HC1ZPyZB
	 BgpzgL1E361yT8z7+KZz/2zGisEUa3oQMSy/ss7K8XyGjTHmg1k6bJisIvbpE1xF9Wd/d
	 W0aPIUUerE8TcXEFuI11+rRRTdwfjl+izjTCkXXNeO1pnU/jCkM3DWAyLwYy6KF1BhvTw
	 8dong4RjLc8xAFa6Gpcin30Soes+NoVBfs8KGGz1mM2zO7gntDNyfPEPerS4MEuLs7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794735453;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=9YdGDxh7Ze+8JBYVAz+nHFyu+3sFQKOsF12R5ua0EZw=;
	b=CMgCIOJJcmwE1satA4wnfVMLE6OwZcSdkb5Sb7G8PRYtK1Ettf4NI7fl/h9IsHvWj6w4
	 5BsdVarJQ0/fcFpkrhNDO/umF50L5sArAPgltC6beEwnHKoJexsMLj8cGlCpwMqn0nUF4
	 hPBZzvftb6CmhCQv+czyLM/xKS8tJVcUsq+CiR5AXn/84c9mzT9383TPF7BKqjcfgGE4Z
	 Ex7OyzDfGnWJBnA1Cg0XRHzXohsNBi/VmPXFe7wHVUsD6DoTkzPEl56ECDL1i19e3xa3r
	 dX1ry8DfJ5zq92q1YJnEdW0xgqaP1qf5fy4PqNy28WTmXWyVvGISvYo/VnpIaO7F/zQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y4FvzawB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE75606A31E
	for <sashiko-reviews@lists.linux.dev>; Sun, 15 Nov 2026 09:37:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEE75606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y4FvzawB
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ae10409ceaso2675231fa.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 15 Nov 2026 01:37:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794735451; cv=none;
        d=google.com; s=arc-20260327;
        b=siBbfMFtvUFOtMUOXFceTveVrjo+bjuaF0NEJGTiHcDi8ZSUm5sLNL0/WsoBi2zEdC
         56XXTiQHpOszKczndaVZWsGypD5t1zz+0P3QIs+QABfTK8kumqp/aI/9vS/AvA588As4
         qeKqdAZd5IgXTeb5SKW/Os0J++BZcO4ZrIqx4neqmkPK3rOJ1L1TArihfH4T1trPD34L
         zDVOVd2pQZR6IC9VHrYePx62S91G5ksNKHQ8ORP1dqRLCE/R+EmtHliekTPtnt2veHuK
         FP+IOawA6W0vTchuC4CZLeGVCZXNi0uwFLwlU6yomhgIuTR/9VmBfGQfLZmTFQWNuMEV
         P8jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9YdGDxh7Ze+8JBYVAz+nHFyu+3sFQKOsF12R5ua0EZw=;
        fh=DHjdiazyXdowSKc8QFJ0cQPiw6JytCzKGsbsz5/ouWo=;
        b=L3dFhvKWRAYZjTOssb4BLrjUyF5vFtZQgAA9MZAxuEXSpbAbQUZRUo5Slz8vwq+O5/
         N+8YF8NYVhRYjVHteiDexi7uO39IuKoSzw7hvemkXRfqQGEazgI+vqaqjyBjndElQdwH
         qlQRM6CU2oxfWOyoJz1qVmiBMpazjoflRIWVnSJ3Svf0khnWC6lXmLxpbqtvO32JOD5m
         uvZTjsljExJ6/1ICV95MtmV4gfvizOxpMiJTJdutPqXR342ff9IuaduX17/s3+RiTuHk
         V5h8eDK26AJtWs6jpSXz7ELbZ1eAk+UpDX9sF2j4v419PocOXm2CIusbZnJmolIxFclH
         Ek7w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794735451; x=1795340251; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9YdGDxh7Ze+8JBYVAz+nHFyu+3sFQKOsF12R5ua0EZw=;
        b=y4FvzawBHqVD3kIuIgzSSt9T2zQ7ERPS1dyyN/xTJMrPU5NGUReCy2nEtcrtYvql2Q
         r3ASsLpPaefl796e4N+WjFMEXZVph7TeMaL9W0m/mmTT/oPJuDXp9qf1xKcJ5EpoFj+O
         zDcwpko7oWz28vECdrf8rt6snhmj1S+fSGfBExWsM47UsdQP0GoPSjvJX/v+efMO7gmq
         TvCfDf7DJzHyDBbhxx9PagUHKBlKVC4ZUzE1GItI3C1YiMMTLaMboRHwMy3ti6NPlmMo
         cEtL/60i1PNX1RnZUd4IJTdHGS6UDcGcxTCik1jOW70U6yOmHE+cD83fsvqg3ipuTIYf
         83Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794735451; x=1795340251;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9YdGDxh7Ze+8JBYVAz+nHFyu+3sFQKOsF12R5ua0EZw=;
        b=doO26mF/jkvbO9ceI8P8OV+oPletHv6o2R8hlqgIlo6NChRJoFpb2VkXQxNj4B+4gz
         GPX6CTe3HJ3NNC4rqsYSoEtCH/ywgetT6k/ucB6zbxw2K5Yu6tVYvigDke8SGrtCBnid
         f5mBKteVjoTbr2G41BylzJB9iLrcK7ND3U5VxC7jUxW8L5XHOizyfcK+a+ih8o+yzH18
         ycD7BlCHQeJnipvIu6JAEXkx9s780xv7nTfww8663hRndHihbIskxs36H4sJYjpjuO3l
         oIX6F17qqc/3LmnTgsU+9RlobJrq0valV4DLYwsra8STOEdcY39AhYcEXBAhhu8JXqQK
         +RGQ==
X-Gm-Message-State: APuU4Z+BZ/KOtaxZucyhpnR7l/ovjLoD+eckDoPYCy7qtoZHcNODr6CF
	u1yB0QH9AR6HpCitTxXWri7WZPHmdz+DVxibhzXqVP0Quzo7L62aok3D02lQ65mbgun4uuUtCTh
	fsWJqirvhbHAwf9ThdVzIcIJAgj9ztRQdHYAoMOH3NA==
X-Gm-Gg: AYBFou1yrgU2HHGIxjdOd+VTjzUu81EvTjod19wdXjQiHcOQjygY29D3UhEZT+QfDJo
	JzWZFsO206WUz+23Ovvcb4cMDmDSFwWOG1oMNmjY22uLvjYDA2ZCwKkFzoId4nxFI2/FhRX0RH4
	pBi/vb+Ou7MQ+Il8Qa2IDDaO8fgvoW2zZmI5ghhxpVL2ZG/qxiidABQ5XvCwqYEe4qmcDQmmyAy
	lJmLUbR4jMqM7/ukTqZCUVfkzjb2fRDKJnPWUw5pOt1qFU4Db7L4ZcDsRHKwOiOohR2GkH57PBd
	9VqgTlar7Mog7UsWTBc7Za8XK/ul2HsvmmGDezFj/4Nfmfrv43RY/JmTyQo5Wv9ZFoWnb4jVkK5
	E7VxSn72qbDfFj4kKjgX7fjUkkU5rYBVzZdacT46mLHiXGYgn7E8rQ9S/i9E521F7r7l3SEM=
X-Received: by 2002:a05:6512:3da4:b0:5bf:ce1f:cd22 with SMTP id
 2adb3069b0e04-5c170434e66mr3022509e87.0.1794735450387; Sun, 15 Nov 2026
 01:37:30 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261112-sun8i-emac-jumbo-v2-0-aca0cf23cf17@gmail.com>
 <20261112-sun8i-emac-jumbo-v2-2-aca0cf23cf17@gmail.com> <sashiko-outbox-212453@kernel.org>
In-Reply-To: <sashiko-outbox-212453@kernel.org>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Sun, 15 Nov 2026 01:37:19 -0800
X-Gm-Features: AclHuK-dBs5tcGLiNTXMlpJ6fJ506k-GawskVNNq_c9vi7eI7zz1TvcPiOwmtXI
Message-ID: <CAEy9hNW97JqTBtjtYGt8_gJetjUokirr8U8oWenKByDjenefvQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2 2/2] net: stmmac: dwmac-sun8i: Enable jumbo
 frames up to MTU 2018
To: sashiko-reviews@lists.linux.dev
Cc: linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> So what you are doing is just papering over what is broken underneath.
> Fix the actual problem so we can have MTU up to 9 KB.

Agreed. I'm fixing the multi-descriptor jumbo paths in stmmac itself,
aiming at the 16 KB the hardware allows. It's nearing completion; v3
follows once it passes on hardware, with 1/2 included.
