Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793703928;
	b=Mejx6Ays4TESKJHlxsquzUGdXx++p8DM5VAwES/A3aQpfqWU0MejOhHMT6ItSXKESYIl
	 gfHBUiNy3QPkEBGBlO2tDnlnXoPd6jmx6LVwlsHbTmPb0FyAcSF25kXJzOuxrB9w90IuO
	 s6/bDK+YtTwfVvaPSxLH9NTfHQ7yE7a+24HQ+QI2UxIU4VTKeGlU0C7ixdYfGglf1Yqj1
	 GMKNRcmc5nsUI5uiELoLXUXhVDS/MY0StKC8FaT1fF7GWA3FbASS0UkpuzDL80yIJSUZD
	 xVx0iiPlsSWLZTC5iUnBpwJu8Dq/qBLke2U4iB2FqubwFAR1+aQEYqM+eA8O1NnvdlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pJi/n0AaKQOOTYBC/6OtkfE66KoOOzcdQt8wdIV60Jc=;
	b=TcbzMFem+Zg+suAZ1+ZLC+x/+3fGZfSoRHB/mPtbhBNUcydbN+1PagQt2aCywgL/W8Ky
	 Fi2Jsv9kueOJ5O8BTkxmZKO0hcxncVjCR1R7Fx3vqWAt34LPHYHjrg00J/RInqs9IzSFL
	 LqjXSugTO21AzCNX421R7DzYN0xFHxn19yxUPGtO0n/Y/OaeIhlavYI5ZZrAh7nR9v5+O
	 Zv/oSZJIxe2yJMYRNnmVijmaM5WcQ0K20szzB84GZSgzt6HagfoZ7z+K/pgfnTbopiHx1
	 8XP8ZTagtMdDMRStoyqOn+i1F7eV2JWkejvzH0JC9ab4sKixsiyWlD6T70mf64RbSlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="LAHseG3/";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF45F606D822
	for <sashiko-reviews@lists.linux.dev>; Tue,  3 Nov 2026 11:05:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF45F606D822
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LAHseG3/
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so33912845e9.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 03 Nov 2026 03:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793703926; x=1794308726; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pJi/n0AaKQOOTYBC/6OtkfE66KoOOzcdQt8wdIV60Jc=;
        b=LAHseG3/Tl08V0DpVqkKNjxJpfsiX2TrlyeuCdlBTC698J3Y+MtK0xzJc1SVmCl7Dq
         FnVMsYf1AXm25bp18nyd+4FQtxKZCN58Y3pFB/tyQtzLZr2UbDS5KuIetwV1YgwgH/Q3
         wYsss5/9Htxh2jTUYCbyrhK6o498p0IzoJuCKTV6fOxqhTGQ/PDl3Lbwx3mDN7kOU0aT
         ZQ9aNd1QyNy8j+kCOm7W98sZ9ucGE7Md/DlhAPjk6Iez7LxEZ7r7XXSJzMLT4J1tVPqV
         ZA44zMaX5/afqC1fK6xW4vDUkNlkhos9bjHCZ02r9GJ5AEY2Udhl6jquFizS/JoYNoLN
         ifRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793703926; x=1794308726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pJi/n0AaKQOOTYBC/6OtkfE66KoOOzcdQt8wdIV60Jc=;
        b=O30+pHVAUMvVFN7pDTl9KbHihOnEj6TfiRtLi45AGRVzVufsLxl4rtCAAxUYQsE/m5
         NUH7r6YP/cmVjKbzW2qoeyBUuMUWmhHiY8DWKRIjoShFdrN6ohIx6+X65N8e3WTt5JL1
         HamUmm578thXgLRssdfP/21ifKeWLM6TxGclPPsdUEAFQKcT6SzMRo+BsTXBWue3LYkH
         Rb5ya+eA8U3CJbk9noPiKHGHQGIbnS5oZ6Rai9YkgiiwHasWs89ej9o4sjhX7TxNs0Ql
         ySZ5GZRh1N0LQmvqMEmDjujJ4k4yEyciF9+cuNK+p45x63/yNgInnbD4ybapM72Eshf5
         DQpQ==
X-Forwarded-Encrypted: i=1; AKwUvByaVf/eY6v4KyrpaYY4ACKMVQuMPZ+QLeUMDgQoF1k28S+qyYSQtMWINi76vzvYLmXVDHxm4FbvuNfgxcsD5gY=@lists.linux.dev
X-Gm-Message-State: APuU4Z/rAcZ1ydveFtebx1Y9EUbquGGvNX+auotN3L94BXuSG4V7zob/
	aVpxtLavxrVsOMPHouryJi04MVSP2ioHeWG858VWmBm+d6pGXw+TGYAO
X-Gm-Gg: AYBFou1E4DVJL18+UGMpkHeOvv11D2tqdn3uKv2Xj1hV5LMnbHQNM/I30XBL9zqauOP
	UuXBx9zFsDqbT0kfHDHBFDoe8yhb6ucuJZqTUQTcGhvMhZtrPZAnPIuZUy0poVCtW6zZTi/4452
	dtgTYpBjtTW/fOL5P+z+rCCvAlJv5w0ReGxpFXKTlaORZluhlrk2jzP+DuaEINAVa+JupEHbooG
	UusIGxTjZvUPUyB5a5pPzf7P8Yh6yyFoml3sssyiQk+9qKr0BXtAWHQ8OpsLBoVoJiwB3/H/0gm
	4mMxdkgze0Y9GiX3D0VhS6gRcKp2CRAY1P+nR/yrIIAytlCjLuxb+vnd9hdRvycMur+gaUqFgt/
	b1ebh2t+4nK99YpGcocIjJJbBycQ1y5y2RtR208yNgqgDzYKJyJdBZaPOccPK1d+tMjvkyjrpHn
	990Q487lraLsRSZUKuLnJEBjSfq0s/G0kt5bCwSJQe1wiV0dQd2VX5o8NFioHZw2NWiCY7Blsxn
	SHW9meac8LInCXTfCokEd495hoYcQIDJljsl72+ir+VMltc6+AL2umAY1uxsownqdqVnc/RvBMC
	5ZhJIFA/XUqL4gNaim1HOGpj30aBvklZxgChyR39VawJRsOeASCqBbifPEYhar93iXBUGZLv10M
	UGH8lPNbLXMbgvGapduidnUu9QgyrDmNDSLN803/fHptT+88ERWlx0w69VwhZs+1B5Jw=
X-Received: by 2002:a05:600c:3d05:b0:4a1:faa1:3813 with SMTP id 5b1f17b1804b1-4ac187a6960mr289278915e9.27.1793703926209;
        Tue, 03 Nov 2026 03:05:26 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:14ec:7986:30c8:6bc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2afee292bsm53218155e9.4.2026.11.03.03.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 03:05:25 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Igor Reznichenko <igor@reznichenko.net>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH 1/4] dt-bindings: vendor-prefixes: add PocketGo
Date: Tue,  3 Nov 2026 12:05:21 +0100
Message-ID: <20261103110524.2812831-2-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103110524.2812831-1-romain.tisserand@gmail.com>
References: <20261103110524.2812831-1-romain.tisserand@gmail.com>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PocketGo is the brand of handheld game consoles such as the PocketGo S30
(Allwinner A33).

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..f538e6a27ec0 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1339,6 +1339,8 @@ patternProperties:
     description: PNI Sensor Corporation
   "^pocketbook,.*":
     description: PocketBook International SA
+  "^pocketgo,.*":
+    description: PocketGo
   "^polaroid,.*":
     description: Polaroid Corporation
   "^polyhex,.*":
-- 
2.43.0

