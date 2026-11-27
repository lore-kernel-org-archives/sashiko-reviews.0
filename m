Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795742786;
	b=vNebVdmvNMsgEC06Gv6EFspjcOqBUOiWIqHB1vBygp3oJMXpBXGOrQdo46amIVrNLhoF
	 KvVaRBrbMAG4gKVXXMBV3gRP8NU7NhvuSETnpfhbOo9SbfboaTxx+BhZmIvmhs4EupZDd
	 xoCQkmc+ery3ExvihDHEuHqpVm3T+rvxj0MUcDNPABK7wdXUvY0Hj68w4M29Rk6dtYG98
	 7+BxZOwWRRIttVHlemHA5yTp/yE8yFRVuxWv2UYg+VedUkn0j2XvUZk1f+75FzSCLk8nE
	 mcCZdMwxXhTKVXM9fV+RQuz+NhLxto4t9fYAQ6rRITAomIwYaj+bD/Q3Ri/NfQreoLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795742786;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZT5vY911PY+oPZWxUSYR9KkzLhjAtMnoOlULn7xIyWk=;
	b=NeOtzn93IeP3NzcFqmQYQaFok/53nSnSI6zoD8dh9unPnAtfKuiu8OscAncBMLGCkVZa
	 yu76MWjIIsNCSAkBR8E7VURzO+/9e9LzC8eYSACn4gbrjiYX0R5fF5InFK70hUcyU2SDM
	 W/jKVYKv8XSs++WEWKPNWvQQOFXjEEb4Z3vt6FaLDCgK/YjAv2PW4F2/jm+u3h/7d0qND
	 xaOBfxUVNRkHJQmtlYTIjK+NYWQnybRgNR0BN2FfTX104UC6MikxTVkIS41qy2mBTHwq7
	 7uoG3Ic3OA/ou8V0Sm6pqkU6v0HPGbLc9qQ2rDky0RBsu1Rl5uJqQGd8WhpkQBbwUwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XJALXOUo;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CC7606A31E
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 01:26:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3CC7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XJALXOUo
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cde5a7d7849so3291117a12.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 17:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795742785; x=1796347585; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZT5vY911PY+oPZWxUSYR9KkzLhjAtMnoOlULn7xIyWk=;
        b=XJALXOUo6sxqAH5qlD+BePlrk38RJEBIz3q5rmoHNzZQvbOzL2zvzv0fcU04kMbb6w
         EIqy77qdDuiSjXFWt6nXBcs26keA4rD56f+zUVHt2shkZZFfXqFajpZ1KJrXMYC3GFjp
         MjYpjK7wPOv6a6NdwHXdJYt8F+2oe+kmX3nriYnlIYOZUyJzpj6N6BxS705uJPrVa3w1
         yDsgp1At5dbMBeykEzbi/8yLGTarsM0U1d/rGSKNgrcayUIOvCnqsYAplVrsPByaHSTp
         +/pKPBhhmCy2XOCgAq4LmYFeWfHQw0UYdw/Qt2PQMj7Y8buiOl5fRsql34ectaVRyT7z
         d1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795742785; x=1796347585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZT5vY911PY+oPZWxUSYR9KkzLhjAtMnoOlULn7xIyWk=;
        b=bVXyyoMs7gtgi4ieEzXAF+YmFVLAj/eu6gC5p5Onlb0oNgM4xU9D/gaD8hHSc4TlAE
         +IR3ncQPk0J+rUPbufYOB58oaQD2l/Nvy8WUwOaCT6Wi2M4i++EBqm5DafRkRiraL9Ba
         Cd3jhGbeBGOPOkyHb0/LfnXxuchdZfrZ40mE1e4c63q1HfYiKZ27MzpXl+3TMHaNdPgn
         SOI55Xk7rMEQnc46OFD/8I0rxzuc8HlcVIzUiVjBg/n99xNwf5qh9IERMPNd19mYOmad
         EjNAhReXmMUQKg9kSZPJ7uQUdlnjyFCiSZGiEKkRRV4NuEn5Kz9UiioNNaV8RtbvbakD
         pe6g==
X-Forwarded-Encrypted: i=1; AL+hErEXeGFsZmnR4gH0+a5M0i8YRkNeDArWT7FvntveMFkOKtu13Iyg5QnjHsfjByfCkaUOxGaUIOQ4OyWrmfQxviE=@lists.linux.dev
X-Gm-Message-State: APuU4Z+VA7BD/2P5cjsN2YU458zF/P7bprpozHeKeE3XEh7sPIMVOsxm
	yWVBcGPIYytwrotSHWINKLCSM0ECBfU3Y/NKMBs0cfoYAMwcEIYhH492
X-Gm-Gg: AZFdTZdP3Ejf3onzjRBNrLD1UuzPttUYxgxrCmvlLLZv1DF8PnuoL4yZ+yg2e/Zg5y4
	cW1pmRZnquXZ+VX3KBvPCxXHpeyjxa/TVIw2QfVzd9SGv0LDxJ67DsJ79SRR73ON6TDaCCpk0dm
	SysaN/ZBixxjET9w2WBaMvfsDSYkfKNOxvuM10KkJZZ2nFvLnuTraX4wN06qHNVIN6wbVcW+d8E
	qNggGQFETfcj1cMCAHNE762uibulmr0H0Q/zh6DvpajobZYqluXc9OydTj8xI5VYib8nM7TXzgs
	LPhSwsOwoGdy+r6tU6xEIRXT1DH1jfsjFOgUNlKe1zVlHq89V2a0Ts6e1uHE4WkLER5jLgDgYuS
	b0OK6kePftP4ihGQFF0g0TEO+GNrzIgzmCY1dteXLUUsnVXqCMfG3R9IXfhh/QqQcpPVfgRLv+b
	aJihyRsysTh96UBNAr/EDCsBIqIa1jItdz60pMdwzo4pv+BMgAztAkbfZb9SyWAe96IUDU3tpVs
	ZXDEopSaTQglTCg0Y6rGD5hYGVF7E+abbWZfxiJNDxYU6Eq/11zQV4iy59lkgiykMCraZ41KRZS
	ndf/BdkYyP+UJ6Ag1HT7l4JI1QURcKPy5pBH3r8AJ1+sHXQeCJY0KpnYX9PkhV6LUDk9KIBWBch
	hh6Fp61fr//DDbNBO6EOLKny1v0Th5B9s6W+WDlj+CSa9xw==
X-Received: by 2002:a17:90b:4a47:b0:3b3:fc1f:a5c4 with SMTP id 98e67ed59e1d1-3b41c8dc821mr22091582a91.20.1795742785083;
        Thu, 26 Nov 2026 17:26:25 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:1432:1241:93b7:7b4b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm35042866a91.4.2026.11.26.17.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 17:26:24 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH 0/4] iio: adc: Add the Miyoo A30 and PocketGo S30 analog stick MCUs
Date: Fri, 27 Nov 2026 02:26:08 +0100
Message-ID: <20261127012612.1589039-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The Miyoo A30 and the PocketGo S30 are two Allwinner A33 handhelds
whose analog stick is read by a small microcontroller: the MCU samples
the stick potentiometers and hands the raw 8-bit readings to the SoC,
on a UART (A30, a stream of frames at 9600 baud) or over I2C (S30, a
four-byte read with complements). Neither MCU takes commands.

Both drivers expose the readings as raw IIO channels for the existing
adc-joystick driver. The A30 MCU pushes its frames on its own, so its
driver also feeds a software IIO buffer and adc-joystick takes the stick
from it without polling. The S30 MCU only answers when read and has no
data-ready line, so adc-joystick polls it, as on the Anbernic RGxx3
boards where the stick is behind a SARADC. There is no scale: the
readings are raw ADC codes of the MCU.

Patches 1 and 2 add the A30 binding and driver, patches 3 and 4 the S30
ones. Both use the existing "miyoo" vendor prefix (the PocketGo S30 is
a Miyoo/Bittboy product). The board devicetrees will be sent to the
sunxi tree.

Testing: each patch built with W=1 for arm (multi_v7_defconfig, both
drivers =y and =m) and arm64 (defconfig, =m), no warnings;
dt_binding_check clean for both bindings; the board devicetrees pass
dtbs_check with these bindings.

On a PocketGo S30 on 7.3.1: about one single read in four fails an exact
complement check (the value and its complement differ by a count or two
at rest, up to about thirty while the stick moves fast); with the +-2
tolerance and up to three tries, polling as adc-joystick does (two reads
every 10 ms), no read failed over 2 x 6000 reads at rest and moving, and
under 2% needed a second try (exact check: about 4% failed). The in-tree
adc-joystick driver on the S30 channels reported 365 and 374 events over
15 s of full circles, 42..231 and 24..246.

On a Miyoo A30 on 7.3.1: rest 136/123; reading the channels from sysfs,
full circles 22..248 (X) and 11..221 (Y). The in-tree adc-joystick
driver, without poll-interval, takes the stick from the IIO buffer: 826
and 852 events over 15 s of full circles (the MCU sends about 67 frames
a second), 37..246 and 11..220.

Retested with this version on the A30 (7.3.1): with only one channel
enabled in the buffer, each channel gives its own axis (stick held
right: ch0 alone 141..242, ch1 alone 116..119); three unbind/bind rounds
with adc-joystick bound: no warning, the readings and the adc-joystick
device come back; at rest 139/118, +-1 over 50 sysfs reads.
On the S30 (7.3.1): at rest 152/126, no failed read; adc-joystick 1213
events over 15 s of full circles; three unbind/bind rounds: no warning,
readings and adc-joystick back.

Tool disclosure: this series was prepared with Claude Opus 5.5
(Anthropic) as a coding assistant, in an interactive session: it
captured the MCU protocols on the devices, wrote the drivers, the
bindings and the messages. I reviewed and understand it, and tested it
as described.

Romain TISSERAND (4):
  dt-bindings: iio: adc: Add the Miyoo A30 analog stick MCU
  iio: adc: Add the Miyoo A30 analog stick MCU
  dt-bindings: iio: adc: Add the PocketGo S30 analog stick MCU
  iio: adc: Add the PocketGo S30 analog stick MCU

 .../bindings/iio/adc/miyoo,a30-stick.yaml     |  42 ++++
 .../iio/adc/miyoo,pocketgo-s30-stick.yaml     |  48 +++++
 MAINTAINERS                                   |  14 ++
 drivers/iio/adc/Kconfig                       |  24 +++
 drivers/iio/adc/Makefile                      |   2 +
 drivers/iio/adc/miyoo-a30-stick.c             | 204 ++++++++++++++++++
 drivers/iio/adc/pocketgo-s30-stick.c          | 149 +++++++++++++
 7 files changed, 483 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/miyoo,a30-stick.yaml
 create mode 100644 Documentation/devicetree/bindings/iio/adc/miyoo,pocketgo-s30-stick.yaml
 create mode 100644 drivers/iio/adc/miyoo-a30-stick.c
 create mode 100644 drivers/iio/adc/pocketgo-s30-stick.c


base-commit: 92c9d64c0cf749c8369403a32630562f0e855a6c
-- 
2.43.0

