Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795778207;
	b=RsVDQarbCmskUnyOANFpL/jYeDYbs2SxxxJtGiapDUvfwqbDDrkRjKzsUv9Mx3PE5p0Y
	 l1YSVeKrWEf4z4L6oDuh2VODdFUbxqOqgi9GvAM3y+jSvZtl48SHOCjAxP8lDDutZFeY9
	 OCKhi5AJelnteXgmPRErlm/aZsnhXrXElKrKlyzUYxRxD+J2i1PtgCi7Q8H02cSmSog8N
	 qXcDE5zjqSBQjR0woCR+51btgRBEB08T6QVY5OlEMPc2SBfKLM8OC1jEhV5I1FHCEry3a
	 cOexEv0eN+6NUsa22w1AMchTOYHol0PZCfsD0Hjci73Azyaqczn+aO4hiVvGrZbaN2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778207;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=fB7AjFVZA6hbz5yhYMWpLKE+61Bh8LA6GXONV0oBnoQ=;
	b=gnIW3OmDMjV8coiOUX5KU+37S6M+yBsn3iLw5r04rc03FIJ7RlTZZ4wQPXN1VzUFcrta
	 tuNlBWPnEt7ux21/k2yR8esTFLYF4U/fjjNW1nTqkXiI0RtWN8uMS4PelW+7RzMBAHzCd
	 sMRxMbUpKcrgbjEk6P5FuTtSF+xpwWL1eaE8F/N47Xw9CDse913N2zy4tKuprDtdQyh2s
	 uZ+FBwY/NzRrkGRp8pfR5dIylq0yQa6df2mfbbD+C72p9YUrZAjMSZkNEkaVXr9RL7LBZ
	 nwna27Z1hqjeK10vp2twrajbK1XreseJvKsqecBPuZVbk3p5b1zcivV8ouLpc1FvAJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XIY4tUO1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E21606A31C;
	Fri, 27 Nov 2026 11:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XIY4tUO1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E65A1F000C1;
	Fri, 27 Nov 2026 11:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795778207;
	bh=fB7AjFVZA6hbz5yhYMWpLKE+61Bh8LA6GXONV0oBnoQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=XIY4tUO1iO0N32nF41SaFX0FIU6y7qPj6l70Tt6nM/g7+oLvmYkrb91Uevtu+WCmj
	 yIfW8C25SimZgk8ajwJ2Muc9vHFBHhy2r735IZ2nPpMRe7r/VRs8J42H27+iZ6j6hU
	 A+kLRZtftiX71CqtOKRFCTiZuPGcCJ94zpnI1F9TMFeOsTo6jHqyzVAi69xshb5//T
	 3RD/49TUr2Vcnqw/kotrkkbhi9b//upK1Zapysi4jY64uPmMVRjo2E8f0KczQcub87
	 x5AijSqlA0CZYbM3gw4AZg12HVmV6W6l2zTmVwpVulO2aOehvTeHNjSaVmHskUWmQX
	 W07k/yVFr6Wgw==
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
Subject: Re: [PATCH v3 11/11] phy: qcom: edp: Add Nord eDP/DP PHY support
From: Manivannan Sadhasivam <mani@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Nabige Aala <nabige.aala@oss.qualcomm.com>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, 
 vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <sashiko-outbox-217102@kernel.org>
References: <20261116-nord-drv-dt-v3-0-e3d3bf0e2c49@oss.qualcomm.com>
 <20261116-nord-drv-dt-v3-11-e3d3bf0e2c49@oss.qualcomm.com>
 <sashiko-outbox-217102@kernel.org>
Date: Fri, 27 Nov 2026 16:46:39 +0530
Message-Id: <179577819984.3421.10994547159567052994.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=366; i=mani@kernel.org;
 h=from:subject:message-id; bh=jQnuYXuOAGsc/lzQqiz8LyDUtWXDdDYLB1ApE7FX+sg=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBrCWaaP9QzsWS7L+SR9mqpkFBIMdiU8H5U6S7u8
 Ayi8Ul/dVOJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCawlmmgAKCRBVnxHm/pHO
 9UTGB/958CXL27cfYFEPvCQkV4ejUdgILBa76IhDFzPccjEAma9Kve65f1WKJDlT4Jdnn+cI+xJ
 I3TUCAZPwb97pM+BrQqDC4p0LGWWwYOQP1tO63gTTemNWOKGFlgAIgNzy1PqsMtQN36O4C5hpzB
 2ILrqAPXofSxGXZaJzAEvUFQK3NGBuqbjSATVGeRUkAw1wvr4kJRihbwAdxCYxR9mtLlRaZkBiM
 5JiVUh2ks8oDd8RMNvny0zVOsDfgiZDTwzyfcOrbGWxHX+s/weaFxju9DqPS4rFjEpycv6Ry104
 3WBiNo0WjFEsWu7N7ANc0xjECW9aKve074OCPFxGXJpKUHBa
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-11-16 13:44 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Low] phy: qcom: edp: duplicated v6/v8 definitions and misplaced Nord
>   code
> - [Low] phy: qcom: edp: asymmetric DRV_LVL writes in
>   qcom_edp_tx_res_config_nord()

Both are fair concerns.

- Mani


