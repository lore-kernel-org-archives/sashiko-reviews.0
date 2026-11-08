Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794124136;
	b=alcD9+DyGpTk1xNtZKJpbqA5AyEahy001rSFdeY/wHIrxGBvHGwp+rVWfhX5lzl16+b5
	 HR4VPvi/Db7o0ueJ74tl2jwdPEKRIffUHA4Dw8jj4135CuuSAEkowl1phdGiiPqp8/dKc
	 P0jltx9h7bkPid8Qkf+HSFnFWu0Nw1tIRr60FkFi+d1eRrcQLD2dbAs5IHAujJGJSrwmE
	 UacWSHgoX0dU4yF95PXCeCcHPTKx0gvsBSqbaTxWLtCzXcTknNpILtPcYquEB0KtW8ZmH
	 DH+XCsDAjB/s2BI1C2fvPAEUc6zZPtuFZiysHLBESw72HDEID6wmfxrdF+7EQTfH9eQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794124136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=q1Zvus5rC8hShMH7t8nxjox6t7ensKu+IzIvUVh4Gsw=;
	b=inLmfrLifLqXPsJyw385QxCRWh9X08xzE9IyDaz6isZMPhXAuG6k7/CVMzIfcALhKyXt
	 jhOdVwH49tA8ok8fmqlfQqkj9IVCs4Pbi1ul7QJ1GROQGDXDPiTLfY3YgOliVRumPshh0
	 dxpqOwUAY9hwrQm00qB3tuC3ZaZdCYps2AvWfwvaaezT0ZkFXa3Mw6fs6tFskJmOJKwe4
	 P0mlLN+v6m3iK8YOG+mKKic9fgHzKnodqbOAvuxbFlQjkggJKxqWEoJRcUJPtfg3LN4Mn
	 QCdKJNHjqy7ydwX2MkGG6noPNkwmwleuJ4et6b/gLnWMEQxYLh5JSoN3W1xABGoIQKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sjv+GrbU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D6B606A320
	for <sashiko-reviews@lists.linux.dev>; Sun,  8 Nov 2026 07:48:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1D6B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sjv+GrbU
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8871ada1a26so1187917b3.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 07 Nov 2026 23:48:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794124135; cv=none;
        d=google.com; s=arc-20260327;
        b=m5L05odqGqM9NJ2i/O0lx7xteJvxJAwoi0Vi3BXjOV08w0P/9XXSMowmfWjE0Loe3G
         7cUVXDVErudMQavkg3KcgQ5oQPXkJi5oubHJZUxLbCNghIpnN1bK5CdWVs9suD1JP2Yx
         z7hhDHYg6Dck9EXLEBbFOq0cGz5TTLYchwZ5hm/agWuyG+0pY2L2SfeYur0X/9ipp8ZP
         ujkypZMUd6LLvY4okAKkmWj/tnaIulRA/CzLPCpvK5jFx+kdFZzaV3zfPa8kHLAUW+tH
         xwbk+NJflhxNTQN4XhCTOVb4m+cdN2MRqRULNVTh8zoj6DTcEZzmPg+paisJQQJJr0UA
         udXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q1Zvus5rC8hShMH7t8nxjox6t7ensKu+IzIvUVh4Gsw=;
        fh=1+k/ettMv+rtx+la5kjlBwDmBP5y++S6s+DDc67P+Ow=;
        b=XxbIKg36QSl5QDPNwR1o2WHa+w9S+WonrqT4pIXcMXR7sWRVgVShdwg6WsS08o/Vq1
         QgUp96PuhBNIdL67MyxdcMBsTanZdi+uXxgJM22LBXqF/9WTLQKYelLV9IaSRo+ogvHB
         Fk1daGjeAPwH8ZRGcND0gSfC3EbTmOV6FYz5F7wMuqfGWLlPfvceNA7DTz4eWN19LgyP
         emWhMychAQ/Un7HcL52ofx0D19tixbjEFsMsdAoFov3ezFCSHXEMd/hFI5jtoNGjNTe/
         jLkhWa4Nvl7tkdeo4AtPVzkufnTemXxvjVxRuGp2xNMx17lXmjMoXq7OAkrO3vwJMP7v
         mXOg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794124135; x=1794728935; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q1Zvus5rC8hShMH7t8nxjox6t7ensKu+IzIvUVh4Gsw=;
        b=sjv+GrbUTutx2xz3siTAZwjhzU71rvoViTJN68y2/plX1gI8By8v1CYWHEwYk74ccI
         uWsv317vJluSjn9IyzbXlCJvKFdnor8U/hy8ZpM4xvoejTd4loUevIySOdtkz/EU72Jz
         j7DjpVgfJAwFV+j8nYICBRs/v86lwCA48QtSwGBM0ZeYdAdEaOmuNP2yG/9gYDMD9ikk
         reJje1jz9t7x1sLrw1u4I12miGdr2CbtIzObbf4a3TkB21aGIFkyrCOhj5ZEffPF54Gi
         WzzqHLVoCYMnKKAMkmMmGY/76Bbpka0/T9NtnS/+TCw5UqzcIockqtIFffidm03J1N9F
         rhpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794124135; x=1794728935;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q1Zvus5rC8hShMH7t8nxjox6t7ensKu+IzIvUVh4Gsw=;
        b=E5aVzOlwY8Z+SytaI4e4Zj2iWnJhTsSvEfWz1J1ZAQ5v+UBRbx3cRfvpbgQ2AO7Cuz
         KSS4KSYSjS/ySwyvGn6ReqR2dnoQ9+HBgQ68UJfjHAMhdvk6/VqwHBxg0j4hdyIDoLsi
         2FnoYkHQjbFHw+g6QOg2qLprCFth9QnVGMikniNnKlA9yrzh1VCvYjrJlSh/iPn5Mw33
         FkVXvtpQQFDgkSnm0SB8IWSy5wtgM4rzqZ/Jl6LyqC7Hjf5DYo0F53tWS0Yx3IMJcOm/
         XDK5EObzkbGdM3C0Mtb0v74DJD4Q6NOtcwmtaaD6P74RUhwVo8Me8f0yHgQzz9yuzMVG
         hI1g==
X-Gm-Message-State: APuU4Z8Fbirtg4NiRSUOyx7qbLydF30mxVIUeg01hN8RnSFKQaJJ7HAe
	uck/VhRvWUbcB5+8LH8BZ5oU7U9nS0pKlRRwqK5CzzFnWh8w9SmrX6j2DAFEu5xB4S0sPdMIXHK
	0QZrBrp4cXEtVJvh8r2ea869V+/mJ/5yGWJMa
X-Gm-Gg: AYBFou36FoyWH/k7qBAORUFKjAB+jYYaOEVB95ECH1bo75ydvB1Q8uiJy6CJ/9PLH08
	byexUoAvJcStdv34vzv3IwdWzS4shWSxHY+2aqbLiN33YEfnXmd6X7B6n+mupBoANNfxVBcF61V
	1njSvKzT8hdKdvzklPmDD6Vn3bq2TG31R8mKlLfFD7W+cYQOuNdP5fkZic4oEWCpn3l47KS1fIV
	p6D+dV3J7aaY8HQQaY3jSaWan+NHMsqNRKu296xgl6QbCPxWYCWIYzqJfpPZhmDmJZ6SuneaqX0
	WB/QiUzRO0auNdEsbS52Dkso7urWAM7032Z+pdYEuw3OzmWX2VMSbTtspjAr845pELMX82hA9FX
	jMQRcRaJm6LK6fGFIGX6vCJ2g9uR1VL4QuPltEm//i1iH4tZwOfX8/PuieEIUxqCwR0vstOwFR0
	JE4sQZ3iipMSv1qj7AagYN+w8n
X-Received: by 2002:a05:690c:388:b0:8b3:2b8:854 with SMTP id
 00721157ae682-8b36caf6665mr5647857b3.89.1794124134911; Sat, 07 Nov 2026
 23:48:54 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261108-b4-apple-mtp-keyboard-v5-0-e2c97b82669a@gmail.com>
 <20261108-b4-apple-mtp-keyboard-v5-7-e2c97b82669a@gmail.com> <sashiko-outbox-203632@kernel.org>
In-Reply-To: <sashiko-outbox-203632@kernel.org>
From: Michael Reeves <michael.reeves077@gmail.com>
Date: Sun, 8 Nov 2026 18:48:44 +1100
X-Gm-Features: AclHuK80jFNSV0poXYzL--QRjzmnK-TW4SRDsdRWfR9wTFf83IZv331kn811FJs
Message-ID: <CANpmGNv2WHN_C+83FiNZHjKrdrPECCapDRuXL4Bn+0d=00pfLQ@mail.gmail.com>
Subject: Re: [PATCH v5 7/8] arm64: dts: apple: Add MTP DockChannel HID nodes
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-input@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, dmitry.torokhov@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 6:40=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> Are the M3-family compatible strings in mtp_mbox and mtp_dart documented
> in the binding schemas?
>
> Running make dtbs_check fails because apple,t6030-asc-mailbox,
> apple,t6031-asc-mailbox, and apple,t8122-asc-mailbox are not listed in
> Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml, and
> apple,t6030-dart, apple,t6031-dart, and apple,t8122-dart are not listed i=
n
> Documentation/devicetree/bindings/iommu/apple,dart.yaml (the same applies
> to t6031-die0.dtsi and t8122.dtsi below).
As stated in cover, documentation for these was intentionally dropped from =
v5,
because it was picked up into apple-soc/dt-7.5, so will be included
when this lands.

Sorry, I should have made that more clear.

Thanks,
Michael
