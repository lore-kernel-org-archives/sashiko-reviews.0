Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794662324;
	b=P6gOwzVWHKZNYTgnjnFp+KZ1/G++1fUEB/UJc1Azdu13H+hBLwjaT4MIxlm9IiqWbSUX
	 oNdlqS3QuBLup0w97oGpOe3tE6lPpRw/PDyTXa66y6ZTPdDXVYuWVvfvs/Amuc2TBuQhU
	 i8WZbxkD6fenqgAEH5jZORLKUx25arxlnTv027/AWH55jGY1fCEz7ZS1o8Q1xplfDMN6B
	 s5Ku2GYXERk6vuGNYmNbtA19Va9bGQsrgmV9tnU//8YVWShGTMwEoiJFjLY5icTbUIBCx
	 cBIHDspIX6ae9ObIeXN32GT4lUgI9ggE2eNlnJ8oWjs/ZpxI2HNp8dWS+ByDKPcgyBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794662324;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=58b7G1H1JueuCMWy4Xbmh+zF/T7ZKS+k82iVJRVD894=;
	b=Bsxc0o4eZmJLTLqPTlf9Tt0HQszi3HblU34UsgfbllHexoC32Y1arfKhTjs6QIMsnjZF
	 F3O84iopfoRitSdJ6tpF10tDqmvhLdYh8BGlE8fBQ3ATmiEUVfpK4X8PqWeN0Pmr4Xbkm
	 bH9yulBOpkvejMrNderL6FusFm5QrQN8EjKUBFXwK3qOBQjN/q0H+BkzIq8vrPB1BRYqe
	 YSqq20FYs7FJh4P4bFUtzCNNodbhcmeR5x8b9wjCRcwV+c0BVOG4DnRe+ablZgqTaSYsW
	 DxjV8tc9f9hlTIZvRGyY6URS7E50/3oNx6ew9cf9JQ9xYpxmpddmKpWU6H/RwavewsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QEpyu2XX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46E4606A880
	for <sashiko-reviews@lists.linux.dev>; Sat, 14 Nov 2026 13:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A46E4606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QEpyu2XX
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c45551fa84eso436300266b.3
        for <sashiko-reviews@lists.linux.dev>; Sat, 14 Nov 2026 05:18:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794662322; cv=none;
        d=google.com; s=arc-20260327;
        b=ZMvQQtrp3RAKS2MqseqZMvcHxdv3o65ZuVJgvFrapYTTQFDGgwBI1d/7lWGuOyiv05
         A3zvIFV4T86TXgnuJYGiWvelUQJ6+wWqGFFUFvuvNqNoePTJ59HLhAzlQqisaKKgHr/U
         suPoTujIC9ad36WVPuY3A377UIUmgUGhxrB2FeNphP4k+/XwJTNIRk3DSfA43CKrje2S
         CKblQV4u7EByN9yOC7mFQITNLz96XAj53u8S7AQRkQ2Tdt/zcGDZcP2v47wVsCx1gKAx
         k8mfcx0fdjQj4rSg1pA+kHLzRuQebjIdBuwCHejRoa3nk9PsHpBYq+YamjQYXpriUEsG
         QsKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=58b7G1H1JueuCMWy4Xbmh+zF/T7ZKS+k82iVJRVD894=;
        fh=+1h7SXQ5DHmI21+Yvraf6m2PAXvkxbyN0ishmZ3r4eo=;
        b=sxRfLgQsYuA2PApc0qIb2NVNEI/RC43WXBs5Aa0vKJORx+vWnPigsjv2RAoRbYXphm
         tGdtj8BqCy+oEk3GbrMjd6fODhjiKl5YBjf45c3Gn0sqWbw1FnzRFd7go4yqFVT6lWHP
         xOU+rQenAXtE4V1yVogOAxTanMVumnyuV6OMUlLRpeegKEJangGxYoHnFciyvnKnhAsh
         zV1JAWEabR9vqxZ5+lK+brWbuNoGwisNw6BWTRwZS49Ql2aF1Gvao6Ezrr46Vtn4NUW5
         fx3PWvrDb0rN4ThKJJZkGw/taBeS5i2n/eBaY3pfFMNyleuNgiDj1pVS12/rFYu/lCnO
         QKJg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794662322; x=1795267122; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=58b7G1H1JueuCMWy4Xbmh+zF/T7ZKS+k82iVJRVD894=;
        b=QEpyu2XXBT1EedqhFWPZxxYtLtvpI0XjV9Cb5M19dl1+K1kcr4SNo+oZTKs3a8d46V
         47y+i3gKuny3hITHCaLaSgG6jHEmXFcVbPFXi2cbwOD9mjKbSf4XwUF88mIBDh99IIly
         /B4Zj76CZL1s36H41Qu2weMltqm6pxga6BSWpGtUk6dkGcaAr3tuQoGSM5Fhx37uSkHI
         yDYFkI3E+mQ9pbNqL3K5KkWKlZkl5ohQ9NIkX+MJ1GmFLCcKGiOuAFqZACkEXQHErO7g
         h6XDQEkWa9qSjMv7I/mBSBkFWlE8CEcGwFDHPIhabFbYQRvxRQf8MA+6tglRNWwFO7Rw
         DcCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794662322; x=1795267122;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=58b7G1H1JueuCMWy4Xbmh+zF/T7ZKS+k82iVJRVD894=;
        b=vvX14IniL6GGL8maTES/crkCLKpZYw3xI23QuO6zbCP+OXdblEyL0Nu3YhdyHvXOE7
         PsKHK8WvAAU2Q9o1KKIxtaUPD3uE6wJqk92ECCP9fsA3KEElgQ/CzW1va1ZB/QFprAnH
         e9mbtEy2Eup37+ZvaSlawpPDVT1C1jcjW2lCb0tDcZAWidCJ0DvDeU009PPEbdUdTZpe
         aQ/SVBWKrNFrlDsxfT8eYcmC8ok3EkEHv5czp2swOaSRxqFYet4b67DvF78SDlxFDevs
         caRtVRWs5YTA3Lqv4LnoX3dBQYksdBxu1syQ5rASn02ubr3K47hyAammqUhIVfmDbYOy
         DjVQ==
X-Gm-Message-State: APuU4Z+xmaUUzsdxr7KdH6Y1IXALO+HRA/lM+cssLVeFlJOMGwSMX1Vz
	DnLwn5zuYm82fbHbAlsqM6nMjYU39GqjXBsLHKXSVNXjHf5s8zI+JVBBO3bh52P/ZbGqTr6C6Da
	Oe47WDvEIphK5qht0x1FaPBUxyWi418jQwA==
X-Gm-Gg: AYBFou3hl/+8tt1VrTR994m4Qo7OuKdZXU+p2DJkF6DAl36h7+VfLrScdptA+3Rul9B
	qj+dTB3ouqmB8gsgc4o4KPvzp5MnCzo/2gdMrL6Zjd58ynosPF/xXDKVBFoxnCKJP+174fqdhWf
	JFegf/q7rlrXlg68Tqz4FD9r5ZsssBTThW3PdWn3FthCcoANqHLFqHpYNIw2jAeAMNSY5UL7ljE
	BbytWXVVOP6JqYCckkylVpHc35X6kGsiWGE2UogoXsKyyDY7u6tqJ2YTSDEeD7+t2rdTxQzK8Yi
	nv5IRSP+YzSwESyC2V7Gm+9J+sSktG/mvOv61waw+3NX8oa3OFBOV+hnScPNl5c15XyHL1z+Ucn
	C1749d97xVzEbxOgmwx9v7DLd0tA9vUSB1gmStg==
X-Received: by 2002:a17:907:60d3:b0:c31:8441:35ff with SMTP id
 a640c23a62f3a-c50968355eemr493838166b.48.1794662321796; Sat, 14 Nov 2026
 05:18:41 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261113110546.173624-1-a.shimko.dev@gmail.com>
 <20261113110546.173624-2-a.shimko.dev@gmail.com> <sashiko-outbox-214381@kernel.org>
In-Reply-To: <sashiko-outbox-214381@kernel.org>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Sat, 14 Nov 2026 16:18:30 +0300
X-Gm-Features: AclHuK8H_C_3YSuNOFdtrgvuWk2DTznaljzjLDq-5of7gWhmdigWJCNEeRSV-sc
Message-ID: <CAOPX746fNHakC7O-scwkWTTvgovmbqvMLxbBszQr3vQyqn-8jA@mail.gmail.com>
Subject: Re: [PATCH net-next 1/3] dt-bindings: net: dptel,dap8211r: add led nodes
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, lee@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 2:06=E2=80=AFPM <sashiko-bot@kernel.org> wrote:

> [Severity: Medium]
> Does this leds schema pass dt_binding_check or enforce the 0..2 LED index
> limit?
>
> The leds object omits additionalProperties: false (as well as
> #address-cells and #size-cells), and ^led@[0-2]$ sets
> additionalProperties: true without a compatible property, both of which
> fail DT meta-schema validation.
>
> Because ethernet-phy.yaml# is included in allOf and already defines leds
> with ^led@[a-f0-9]+$, leaving additionalProperties unset on leds allows
> child nodes outside ^led@[0-2]$ (such as led@3) to pass validation via
> ethernet-phy.yaml#, while reg under ^led@[0-2]$ only specifies maxItems: =
1
> without restricting the value to 0..2.
>
> Either drop the leds property block to inherit the definition from
> ethernet-phy.yaml#, or define #address-cells, #size-cells, and
> additionalProperties: false on leds and reference
> /schemas/leds/common.yaml# with unevaluatedProperties: false and
> maximum: 2 on reg under ^led@[0-2]$.

Will fix it.
