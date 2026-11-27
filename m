Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795749972;
	b=HeJgoHjwVDWRxHLr8k+TsA8NCyQ2tjsN4+zGej8jhylMZQc5xS6SG7ao0NAZqHPeJ9Yn
	 xjUifTzOePJ2JA/AspEBMD9H4t269YgvtV2rV2oz4+I0IXPDUJ7p3G3b7nckAJz12yYLq
	 aWn9rCU5z0XEB8rf/G1rwis/JDqlccUbzQlKNPDdhRg+JYWDUOP6sNbE7wNnvbAFD9eZi
	 z/O9e69xvS76EiggCA0ZaBIyJQo1Fq0koeFOAYXFCfrYGIzCMH9ys1BN+g/PO6RDgQd3J
	 28hK5BJ8AwArh3Cc2Lg6oTCgZvYyMZeBrS4EsuvEAG84kssK3uMa1HApBJtGCogx6PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795749972;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=psyl4qUMnHJ7E35cGuROJkuzGX0++eVKi2SRi2Q22TA=;
	b=hj8dFSPmB9nMufQiaslxM6o9xwL6Iz6Tfgqw7bFJKhrhh/HmqKBM97DeEtsKuOnw6ojk
	 OiM6s7zTMgvin2xaq95LhlSSCWR1ZaKoZctDPQnqLltVPtijSnwQQATouI0jJXvMoEbbQ
	 k8465xihFdHdfACWX6z6mXZbcIzwq7lv+JoTHJPX22XYSm7NMEtWXUUDRPl/Sf7IwV/Hb
	 mMrWiU9X12LBNay9LG2BBxQf2Kdanbw7mMPMAjHlksIb7G9R83AaEkSw2UoikpMoMZ3cD
	 FbjedkZ/CWJpqYOVTqJ81QEEi7jAWlGdRGSo+kTwBeqHqA03TZDn5MPAypy5h+uItKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jdb1wEHo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF56A606A31C;
	Fri, 27 Nov 2026 03:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jdb1wEHo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E1EC1F00897;
	Fri, 27 Nov 2026 03:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795749971;
	bh=psyl4qUMnHJ7E35cGuROJkuzGX0++eVKi2SRi2Q22TA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=jdb1wEHokSHuV/K1LOOpiVjOzkop5mEw2GY8bpu18UnMcITWvYLFCCsHIOuBawM1a
	 SWCm4lvP8k/emGCkVdntDDh9IJmYWOFG98EdlBfg8dGIYUxFbfcrBQJU4ewu5m4IfO
	 ICD5NoTYMNhcDhBqQfMOVnC0oSvDushuT5W46TxBQJJrbQOel/1I2sXp9gXRh46oRF
	 +AOuCnIVmZindlW09xqzparmGE1OcD9gloGm5kPnjlvYwh/B3qjAjSkZNLtAIaWX0y
	 I1cLVFeiBA2QCMFdH54WXowt49QCZASFG27TLPvFQo0mQkpsn3RuvPw6vmCKN2rno3
	 15fmA36vV3ceQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Romain TISSERAND <romain.tisserand@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sashiko-reviews@lists.linux.dev
In-Reply-To: <20261127020029.1618525-1-romain.tisserand@gmail.com>
References: <20261127020029.1618525-1-romain.tisserand@gmail.com>
Subject: Re: [PATCH v2] ASoC: sun8i-codec-analog: Add the headphone
 inversion switches
Message-Id: <179574555051.838304.11873761399543336374.b4-ty@b4>
Date: Fri, 27 Nov 2026 02:12:30 +0000
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1146; i=broonie@kernel.org;
 h=from:subject:message-id; bh=DfCMJDOEfs4h5g4ABy5IcNQl+5IEVbmoqQzSi38+0hI=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI5fviv2f0sdFlGws1n5/+f6jmSatkiHqIlfrD0tXz5Y
 YMpU7pYOkpZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCRyXwM/yurYt1tOC0mH8vW
 erxn3l7TLRxVPxaIRyip5vztzsu1z2NkeN9uOfE+p8Zrj+muRc+FA4uVPzb4LlrBIfzFJtGvtoG
 FFwA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 27 Nov 2026 03:00:29 +0100, Romain TISSERAND wrote:
> ASoC: sun8i-codec-analog: Add the headphone inversion switches

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: sun8i-codec-analog: Add the headphone inversion switches
      https://git.kernel.org/broonie/sound/c/f8c89079cd90

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

