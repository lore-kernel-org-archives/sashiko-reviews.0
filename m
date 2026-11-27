Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795782391;
	b=3tNDAsmdj02o181ZH5svURy5w+LA+g+Lcjp4nd/gqXSgM60hTMe3KU4WA0F5IzikT7kt
	 +lXzo+7XwFuS+n0t9d9N1nnfXyrgqlMZOCGGnvTp7uAeSbYbFj34tcUVZOxQvZ7PmXhME
	 Rj2g6XX3M/Pu/Fb/K6ssI6WF/kqpZcNvC2NtkD1Q+tK8ugWw4udhKrxZxlTlQs0OufI0j
	 Nw8nUUSDVqrCKaxtPX4dyzicp4Bl4a1xqm4TmQr2CcVofwAgxwNmysrerV+/bB/EdNbM4
	 gYzSfc2gCA6jNfBPzotvWVZA3+0M1rGQbXLFo/lNOZMLjy3nuSnfUz3OrP+vI/IIjtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795782391;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=1YACHt856w6M0a4jo14ZmbPRV5xm/2QHd8y3Uh+V8Gk=;
	b=rm+AKUz/HHWtppp1r/P+E/pZC3qZiK84Q/t8JzqOOJPkjonb83nZ3Hgss5GmiJ6xgN9l
	 CYfUWC5aUPYgiGV2eGI4HCtNlU9vKsaf07/gNQnml44e8Hecs5AF0mUFFshrwvLwMRCG8
	 A3YzCy6uH5qigK2KlwtzY2uKxA6fJGCCAFk6FyO9+3vTxtv3oQYsyEPTr/YqfTv128bUH
	 aT6vLPsN3V/u12izKHxDgAPYBqnHUi5SbPIF9c9esmEfSODlHs3WPMSzd27lduKizwVV1
	 xL+K5GRW0J0OendE1XL9iMzRJbvMT5TLAnKrModBASdUXhlXmtFFsR+h1O5+6m2eRZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZO7Xi66x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37EC606A31F;
	Fri, 27 Nov 2026 12:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZO7Xi66x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 421111F00893;
	Fri, 27 Nov 2026 12:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795782390;
	bh=1YACHt856w6M0a4jo14ZmbPRV5xm/2QHd8y3Uh+V8Gk=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=ZO7Xi66xJ5eiZwNXBLa6BLoDGR5aSVF6bLsPgtU5erQWnMtBt1g7CPJSLW1lJgTk3
	 h184At0WELaNy1wZNHiNuIBarbC16ljGPUZOdDLz2XXn4+t2HkJ72WMvyr7ZMNW5H6
	 n/xS4GyVTHOcuvBxZxERz4s3qigBh859Eux+ovEvbj+g87ePU2cuIvmqkGJG3M+vxr
	 0wbB117JpOIKUF4SjaaoNUEaZ/znTcqpPHrsMdoFYJb25m0jJlqchEAF7ayWVmfnWI
	 uiDG2RJT9U/o2WODwEFHqCfXep6FaJ4ZADm+v2ljSrfOrSAgkVRFac52JJHKJc0a5t
	 hfVfNY117NhBQ==
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
Subject: Re: [PATCH 2/2] phy: qcom: qusb2: Add charger detection support
From: Manivannan Sadhasivam <mani@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, 
 conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, 
 olteanv@gmail.com
In-Reply-To: <sashiko-outbox-209554@kernel.org>
References: <20261111-shikra-qusb2-charger-det-v1-0-5a9d919c66b5@oss.qualcomm.com>
 <20261111-shikra-qusb2-charger-det-v1-2-5a9d919c66b5@oss.qualcomm.com>
 <sashiko-outbox-209554@kernel.org>
Date: Fri, 27 Nov 2026 17:56:23 +0530
Message-Id: <179578238331.13164.6583098975209053616.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1067; i=mani@kernel.org;
 h=from:subject:message-id; bh=VYxpysZXxFobWWtLDUihdSzI2UlztsyVeKhdK5npJRk=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBrCXby9x1ZaO4NWT9P4PUsywKWTFXs45JOc+QdI
 An/QvY+HWCJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCawl28gAKCRBVnxHm/pHO
 9TVVB/0Y+Vq4sa42sXamq1cMKzbxZ8UlW709+zGCKiJ/HruoDc75IYPtg7vUEUu38Oit5DhL2SW
 acL8lNzP8Akcg05LiZTObO/lKcBr+aC2y0hw0cQQmDiNzaLNEduWJEZY8bJ47V/2RKohmK26lq5
 E2IRpV0/pV/6c5Ih/1s6xDOxn41JcsnoNlqt6fR62pjcsevAd5zJ3hBLxGfYkDG52OVyTJo93c8
 63WJEmD++XkAdWDD4YiUjIQynBtTJCMjmRO5JUU72r/2VTuis8Vqx1I1jd+nuET+TZF/VGQGktS
 bYTyqfqGyakGCEA+w8ta3MTpekN8Qfr4g5c0VHqaYPaqJ3ms
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-11-11 19:23 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 10 potential
> issues to consider:
> - [High] phy: qcom: qusb2: unbalanced ref_clk accounting in
>   qusb2_phy_init()
> - [High] phy: qcom: qusb2: charger detection disables initialized PHY
> - [High] phy: qcom: qusb2: PHY left enabled on USB_ROLE_NONE disconnect
> - [High] phy: qcom: qusb2: missing teardown of work and role switches on
>   unbind
> - [High] phy: qcom: qusb2: missing Kconfig dependency on USB_ROLE_SWITCH
> - [Medium] phy: qcom: qusb2: clock and regulator leak in
>   qusb2_phy_init()
> - [Medium] phy: qcom: qusb2: race between qusb2_role_switch_set() and
>   work
> - [Medium] phy: qcom: qusb2: mismatched register writes in
>   qusb_phy_drive_dp_pulse()
> - [Low] phy: qcom: qusb2: undocumented new members in struct qusb2_phy
>   kernel-doc
> - [Low] phy: qcom: qusb2: hardcoded charger name in
>   qusb_phy_notify_charger()

Please take a look at these and also drop the spammy dev_dbg() logs.

- Mani


