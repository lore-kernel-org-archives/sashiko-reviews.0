Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794427231;
	b=kwTcURWP1vT4Vhn7UAgrBpaMMLTBMAPz4RNwFZH3PVHxuplKYXLqYvQhiQrLUeodjaiZ
	 ImT4tL3dBdmOivAxdIe3rSf0m9g7il6dHl4Cn0nTM5EwuosPLW8PC32PSTGXG02vvhs2H
	 ejPtlaLaZBe115zO1bdO9A8V1qcRpez6tyKcOn0PIKKqRnmS5kPJK77CQFbWctLAJXCf/
	 k33hjpdKj5cmX4YVH3bQK0bOu6NDnYRrQVhPVPVNNfjj7HqHPPYMP0s9cEKJBM4Glg4bo
	 eO96jZ61K8Kss858WdVVMiIUj/2l/mHOc9LdCo0zk8ig4EzuyPPLZa8Zu4HdAdXMLfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794427231;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=p+2Z0iAhcp8VOXafcysdCm6gOgr7IJoVThJ4qYkpC4o=;
	b=3zMzUQayX4dlSSXXVjY7CmIjBanS+w0JzGhzfaH9F36Dt2pC80Nr5jSYMlLsjgB/VYUC
	 udHF9ZSTu5FVaT9aGuYm/kcRB2yAXCgcvjyU2QvQVERwDUVU84SE5vwK1I8wWENEdgoyG
	 Iqk+PfQfThnxnpT1Y/GtXiJSElD3/t0wCh7vsXj+qwQncsyUnGJMzu/9eRhLxiHxDsPQz
	 Y8hap6fF16tuAkZ96r0rd8/xkbwLSSfSgaqiy7mddxvt7FmivCWgvjuRKSNHzj87WoT+3
	 FRTuycinpAxy+Ej5CCaZV4BZrS3CLsWKDf0LfrVk3TU/w87H9BVH1zQx8HapiiKestQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=szc184QW;
	arc=none smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95861606A327
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 20:00:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95861606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=szc184QW
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5be4a2d94adso3213724e87.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 12:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794427230; x=1795032030; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p+2Z0iAhcp8VOXafcysdCm6gOgr7IJoVThJ4qYkpC4o=;
        b=szc184QW4dsLA0qvL8b5AJtf1wDV3ChyruGG7c0xbi8nTi4DxwBRzQfvCWC5jlm+3M
         p5PlPIcSZrv6Y+gda3K/isITj+BVmjYELXzooc2jHJ5RYFU+Ph6kI5x6gexbWIzXq3/K
         KLIdfmnpEjeCnxr1zuBBQnfxN16Pr4TpJjteKYFj8jRv1vFY0qkXLdiuH4LQqXlBo3Yz
         eS0uICdMADWLlfAchWp894tHIkLh5Uplbi45/Thrur+zVxt03Q9Ot62PEX5mVm5CVM5H
         tRHn+E7S2EdNcnKkyU0mwSgT6KIP0rsMaQ4mHyaPrf5ITtyhyhkTqIM5iDfp4IbrofVk
         PjoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794427230; x=1795032030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p+2Z0iAhcp8VOXafcysdCm6gOgr7IJoVThJ4qYkpC4o=;
        b=eVS/bOf5/sznvt/YHV1+5w/TTIX2PYumtSybAApgaJpV2Rhx3H20t5/6LhqC8lbSjD
         KU97fWOktaSQzo8MWV7c48sJeUQAPT6ATnqtUq7hG4t2azP0LXUxbFDETDF0fjqaDFGA
         f8YDslXe4ZSa6hre/r732K71vEhJx/Y7HRXhSCB+XSTdxmv1ZoV7tlol3fFXx5kUP4/C
         RyeK+jCLeC4/fGnQsM9RHeY1X6p/Gz1voIsqe4LfpsHksN7l5uGTLKRAmEQEueKO1+KV
         ev14AVZX5vhsQ+HJwbRoZmd5mRFeixvqpQY5lROA8oeR6qnDQMk2t8WKtN9xdwGLNNI1
         bagw==
X-Gm-Message-State: APuU4Z/Gs6kJBvkphv2i+/HT8HmYsifK9TRAQxl6Rh6cuRExJmoZmrMh
	FbE1xt7Hy/yagPqXcnl3ekZtdq09zeu1bWMqacVhNE6C/INvhzthq9HsWvrnzySE
X-Gm-Gg: AYBFou3nwggL01LZPtbIY9nxeTbdjwbLOYWE51wivJcIyMZiB5ANraMqM/dUTgKFSVH
	OOqu1uUOcG6cIW97pNJ8Yg482gpGB3J/MVoRM8pdVkC2XjQQSWphOypj5QJArZ5Z8kBmHz1IJ5g
	K3DSbBUh+S665PGmVd1/iFYAJfCAuIDvXSwRCNv4zvEajyg4myJpBBfyaojMorBDUAHe+qsbcxp
	C5KRxJ2GBBmpN3JaPNciKjKSmWy/tkHCKUjFkj/I665en/ywjrvU2uJ2zL8ReARgCAhEtATk2F3
	ZgFRb8lRno4cv001Er2mFF61SyNZDTMRxby8+RAcT/dhk5zcj3IUAvjPx44rYYYqSy+lI/j/QQd
	4w8/hiZuqd1JYMQOA2bwy85nlVitqcuJrHXxKDZp86LXZtlvyyfZRyuM/4CENHsvG2Um1DQiNhk
	QwgmYpcUZWMMPh5yb3SMfke7W5ij4zHdTN+3BcVrsIyNFSRWnrOTqAMmdvZ6YUblH9K7p20yekg
	AHV1HUEN+XhkwypHVWPNAKFtK5ZpgtKDDSvA2c8mHdzL38YzEZX5akwpCzlkl6DWPUJW6GUcSPq
	6tFFY/1EMChZQR9ou0b8NVy4XF/RYfRHTQZQHBnWfXAw1DaeFuBtg4knlKZH5a5tPULLxgA7PkN
	fjmcAmZ+F3NyUZac5FcCV241x3iw6wEhdh/j2
X-Received: by 2002:a05:6512:b8e:b0:5c1:5cce:7f1d with SMTP id 2adb3069b0e04-5c15d58a87amr1050525e87.9.1794427229586;
        Wed, 11 Nov 2026 12:00:29 -0800 (PST)
Received: from yantra.. (nekmmqtce067ylb1za0-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:5558:447:baa4:a7d8])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157bbe89csm1102957e87.81.2026.11.11.12.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 12:00:29 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Andy Shevchenko <andy@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>
Subject: Re: [PATCH 2/2] iio: pressure: dps310: add a data-ready trigger
Date: Wed, 11 Nov 2026 22:00:25 +0200
Message-ID: <20261111200025.38344-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-208073@kernel.org>
References: <20261110154254.39092-1-zoone.rupert@gmail.com> <20261110154254.39092-3-zoone.rupert@gmail.com> <sashiko-outbox-208073@kernel.org>
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

On Wed, 11 Nov 2026 02:15:48 +0000
sashiko-bot@kernel.org wrote:

> Should dps310_fill_channels() read pressure first and use
> dps310_refresh_temp_locked() like dps310_read_pressure_value() does?

Yes. The wait came with the triggered buffer support, so it is older
than this patch and holds any trigger faster than temperature to the
temperature rate. Fixed on its own:

https://lore.kernel.org/linux-iio/20261111195118.36853-1-zoone.rupert@gmail.com/

With the fix, this trigger keeps up at 8 and 32 Hz with temperature at
1 Hz. I'll mention it in v2.

Rupesh
