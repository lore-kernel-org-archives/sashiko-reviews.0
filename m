Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793708031;
	b=neZqvORNJI75LBcdNFLcaQY+yUsNv3nzv4oFGzYYgyxrD1+A5nU1VT6bMqo00OoymXXj
	 wdxYMwCsu15QwUoe9QLsNv6nztdj0Y3LaIKRQ+NF/80Fj/si79NncDkg55SkZ3KI1Ki1N
	 6yE9l+p9428OEhFHm3jdrhHG/xdel1/Bt+NVjHNHiJw0os0tbXugyMUtxZXYtVnDMiqxq
	 6fcvHPsSPJ0KVIZIBa6W8hMtJOdFQxP0O0Qej4VUIQE16Iwm20YN9J8ckpjKOLtb4WDUQ
	 wayP2QnSD8DWw7KgdzA79t5fpFplyVe5dZYtRkbbARY63LJiq2diaMhqwdcpyAA4U/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793708031;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=n/UFdXyrAd5gl0Qey0z6/JDNLQSoV4VYRc31LKxfmJI=;
	b=PiXIwiexPlvXP4AumkSXBz36z/SuhiGaPq0q7zSKlQGep88Ha66abCNrkVGjv/oW0IJA
	 v5EqDQEdlmIevryPblL8hlGE83iTvJZe/8bl1Wa15MYkCJnqsM6yFbte5PZD8aKkr4byS
	 fCOLxYnkJlci5/XyNqEiiV7iCfgSljQsG8HH/93zMczsEgT759MHG+xtVi0iGyJbmSnpL
	 c34Jdkk+hoBHkRmW4TVzLcyypV1IEfizzS57dBWqLT5ENMeaMN2JF0M47GEJVBX4jbHgr
	 omqtJPguXiyx/GSUJieTObR7TiyEbf5rv0fwKqsU0XFjvhe62vL3H9sQbGghbWI0cUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=pzM0ga06;
	arc=none smtp.remote-ip=109.224.244.121
Received: from mail-244121.protonmail.ch (mail-244121.protonmail.ch [109.224.244.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0E6606A327
	for <sashiko-reviews@lists.linux.dev>; Tue,  3 Nov 2026 12:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF0E6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=pzM0ga06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793708028; x=1793967228;
	bh=n/UFdXyrAd5gl0Qey0z6/JDNLQSoV4VYRc31LKxfmJI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=pzM0ga06AYTCAwJWKDaysdEveVmzUFBxb3BpYxFhCjIRG+ADe+YrIjkxypiOBI67h
	 q8XP+itWyT7thYOOr+fNusL6sdeXMKzSuOBPfUS/ETMVJtpdD5DWs0qX6ECIdnovat
	 0SVzO8n8JdwKBCbciLqNIyUYVpIa5tc+Q3KFzM6TsAuCvF4mOVkZrpwxIJSIacHi4L
	 ta5BPVA90KGECgiXl30SsBbS65VJa3+PQlDZR8P69IvYny3ITVjUdSz6y7LHUw+Pe2
	 iMkhFkPz7Dgs7fqwx4Ar7euxS0HINkWNU3HdZLwHq6iVrr7ncvgnmszIz7UgSTdZv8
	 zyxOOx4fVYEmA==
Date: Tue, 03 Nov 2026 12:13:42 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Marshall <pm@petermarshall.ca>, George Neacsu <geocausa@gmail.com>, Hao Yao <hao.yao@intel.com>, Fernando Rimoli <fernandorimoli11@gmail.com>, "D. Manresa" <dmanresa@gmail.com>, sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] media: i2c: Add ST VD55G0 global shutter sensor driver
Message-ID: <20261103121333.39898-1-lsa.uz@pm.me>
In-Reply-To: <20261103103235.94397-3-lsa.uz@pm.me>
References: <20261103103235.94397-1-lsa.uz@pm.me> <20261103103235.94397-3-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 45bb7be137328bb37ef3a7c1f693d445054ed23e
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sashiko's review of this patch [1] went to devicetree, not linux-media.
All three points are right; v3 will fix them. Tested on the Surface Pro
11 with v2 and with the fix:

1. Auto exposure. Once a stream stops, the exposure and gains read back,
   and carry into manual mode, the values set before switching to auto,
   not the last applied ones. No runtime suspend is needed for this:
   pm_runtime_get_if_in_use() fails as soon as the stream's reference
   is dropped. Here the stream applied 1796/24/2048; after the stop the
   controls read 123/7/333, the manual values set before, and a manual
   stream then applied 123/7/333. v3 returns what the last stream
   applied, which the driver already keeps for the next cold start; the
   controls then read 1796/24/2048 and the manual stream applies that.
   So the v2 cover letter's "carry over to manual mode" held only while
   streaming.

2. Probe. The sensor was runtime suspended 22 ms after bind returned,
   not after the 1 s autosuspend delay. v3 takes a reference before
   pm_runtime_enable() and sets up autosuspend before registering, as
   vd55g1 does, and drops the reference once registered; the sensor
   then suspends 1.2 s after bind. The error path was not exercised.

3. RUNTIME_PM_OPS() and pm_ptr(): in v3. With CONFIG_PM=3Dn,
   vd55g0_pm_ops is then no longer in the object.

With the fix, v4l2-compliance passes 46 of 46, with no KASAN or lockdep
report.

[1] https://lore.kernel.org/all/sashiko-outbox-195119@kernel.org/

Sergey

