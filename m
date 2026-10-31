Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793447482;
	b=hw3EqScx0d8DCxC+60BcCbz39rHuAwvMA4UjBn9xK40p50EAw/I063Ak0xUc5+NIgEyl
	 UG+H/VaQbO/kIC5MYR9PeUVm2GZGmqXW8QbZUoW7SWDU5TVcMLOX/gc8wCRT44AgqBegO
	 ULqMWxmCBhpglBo0HRjjmWawBc0hKJ1z9ZM/UCit+9HofA/dbqTVgHjGDtWLQGknnwO0J
	 0TcTP+lPZ6EwYJD1veXmYzONGu/Mfq3UQwFSDn2gX+UWAkVOMwY3WrYaGlZV3p+sFSRtp
	 8F16zV3upAV5qsWZGXP/TBs0pXzx5LNE/sspLECbUyzKTlCPl9CR1aAvrSQHWSn84vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793447482;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=XTsFWD8CdqjC0DlCbCKRlM4mNdA1XJgLD08GfRbIogY=;
	b=jfr0U8nXIFTyFeuGmmKqecAwuCj6e1vNLeplbsj6GmlinkdNBPNdofVUo3XzRXGWRQx1
	 7UgWea9bhSlDctll+MqOz4cGyAR+GIhbyPmQnct9K3mgi99DA3APK+PGExawxFhv8bmWp
	 929M3fTiZhCAGR9U/8W8Ci3guLXC6ULPS9EEudb2Fzwxkcoome1DC4Biud6lo7fW6qFnh
	 Wt8/hFwcPs82/hKXtqKTNZDHPlAX69NMMH0InjmNSDHGI40y+nvZH18wVr/p8sJbefFS7
	 xfvl7eR9blzwZRYwfS72uiBXq9nykZxNLHoJ5yL0AVucp5vCXvLWBciot25cBQOxOig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ek1ThYRR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CBA606A31A;
	Sat, 31 Oct 2026 11:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ek1ThYRR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 401C11F000C1;
	Sat, 31 Oct 2026 11:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793447481;
	bh=XTsFWD8CdqjC0DlCbCKRlM4mNdA1XJgLD08GfRbIogY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Ek1ThYRR/+D2I8vDpQT19Fu6SSDjeIoL77tvwa7NxLZ/rV2oL+x8tkzU7jmrFGcAu
	 GAzI+w1uSbWzjGTgdx9iAQqPh4m9x7YTJUMdwl8CoXi51mv5PAKE5INhN6HULP3rQe
	 KjWyvWn1a71YwQlMnN7s1AKWZMyUNfmELYceNMZWnrtyEXVhA/tHJ/BTDEVXTAug+S
	 n4nt0VPB3YjWRY8sDpzvILYv+8lyHg6rpEvYEIYz2O4g+fKVSlr4gqHkeOHZ3tzQl1
	 3MKn8GNMGmyY+Ljze5jNsPAJE4LwSvva/IPM3w0OK2Q7Ic78RhTFT3xsU+MYLdYumJ
	 VPI87YXwX9/LA==
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
Subject: Re: [PATCH v7 4/4] phy: nuvoton: phy-ma35d1-usb2: extend to
 dual-port with OTG support
From: Manivannan Sadhasivam <mani@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Joey Lu <a0987203069@gmail.com>, devicetree@vger.kernel.org, 
 neil.armstrong@linaro.org, linux-phy@lists.infradead.org, olteanv@gmail.com, 
 vkoul@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <sashiko-outbox-163689@kernel.org>
References: <20261008060629.2736806-1-a0987203069@gmail.com>
 <20261008060629.2736806-5-a0987203069@gmail.com>
 <sashiko-outbox-163689@kernel.org>
Date: Sat, 31 Oct 2026 17:20:56 +0530
Message-Id: <179344745657.5901.17902875495433364285.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=689; i=mani@kernel.org;
 h=from:subject:message-id; bh=XTsFWD8CdqjC0DlCbCKRlM4mNdA1XJgLD08GfRbIogY=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq5dYu2WR/1P1I5QPdRp5DDPNJSWuzt6R7r9w+l
 nkuSQ5RLgGJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCauXWLgAKCRBVnxHm/pHO
 9dmWCACqPTI+tV98FsN85yzBoBIOEvDnzBLvPK0STY1pFYmj+jzHwXwnQ8wBKaa/eQuoyZcROw7
 m8qf/34BXEa4rwnewMIXU1c0ztb0eHupudTd/cEYwrTLqHI9XWRsGSSKXESn3agAU83E17JKRn6
 Zw58w5TkTgCoH8Vle5jQANfNwhUUhI63vS8+VfV+P/swgOI84KZhK03AMRDNq/yz/DLRRbvUP0f
 4HuzZBf4LzO4PkpBRNWtG7W5UM79B/JB2juWJeMYc1dDmzwpikSWyMllWBX6n/7sMHmzYczFfNH
 o854gQzPJem1UaOn/lxELmw1S6hiz+rnSATlOAnWeoWMF8y/
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-10-08 06:26 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> - [High] phy: Kconfig missing USB_ROLE_SWITCH dependency causes built-in link failure
> - [High] phy: DT backward compatibility regression for over-current polarity
> - [Medium] phy: ignored regmap_read return values cause uninitialized variable usage and info leak
> - [Medium] phy: regression in PHY reset fallback when clock polling fails
> - [Medium] PM/clock: PHY permanently holds HUSBH0_GATE preventing USB suspend

Except the comments about regmap_read(), rest of the comments seem valid. Please
take a look.

- Mani


