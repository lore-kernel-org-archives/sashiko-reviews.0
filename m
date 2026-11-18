Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794998083;
	b=PNTknILK2g10o3mSDlem3+5zbP1TMqUYHI9NqCX9fCqzZj3PNqnG/OHk5osgtr8qIHeh
	 sfdbnIacJSQy9GnbV6lK3GLhAL/PerSJuJU5y6rAMc6myuxKdjUZ+OOekssdPzn32gIx1
	 o/Wb0ViDRD5Z3ZUItTjcP7sPJUF+k43TWslGODrhl0Yi3I4tVeIbQSO8YAy0nxWa8vbnu
	 vN2aEAWESwvbEQvFn+61YSwcL2s2wPsKq+jThOfeYx44Hu7DFUF2vi9aE+SWnp86Onn/w
	 oCcWA0XWM8P23fPYXewXUe98F0r7083YNiVZkz6oqxiKWNOs2tioHp5JflOWU6FpQOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:Date:
	 Message-Id:To:Cc:In-Reply-To:References:X-Mailer;
	bh=VbnsRzldWLp5RM4Wbi+k8602uEkMWd5FOiwEB3P+mX0=;
	b=c+J56srXiLhnpvtWb4bYcAXZNEvjRTpgH3BwbBVCpGPYRmJtH5Khewwv680K/eLVIvvy
	 xBWmaTOlkqTb1LVy2//V/vScNs+uyuaVDxFu1+vIIE7JeO59Az+sZbTaisNU++RsEPPfg
	 IvQm/Pg+1SRf5n8rZAszftMrEbCFVHQteALdffDRVACTYthKCIZiRB6KYTfBJzjPfx4S1
	 2S9/zzl+SRHfaVgF6IOBFBCAWz+NjSQBXM1FhSPsE7Ll1jFcq7tyi6XN98d3yq6nF+ln9
	 yR4E9fWQwb1cWNb7Dv49MpVDR9Xw1rIevlC9HuJvzxCvbanZV9bvNTHjQ2g3DqGxLxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kVWiv9qr;
	arc=none smtp.remote-ip=74.125.227.130
Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA85606A325
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 10:34:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DA85606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kVWiv9qr
Received: by mail-pj2-f2.google.com with SMTP id d9443c01a7336-2ea19bc317dso4483015ad.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 02:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794998082; x=1795602882; darn=lists.linux.dev;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VbnsRzldWLp5RM4Wbi+k8602uEkMWd5FOiwEB3P+mX0=;
        b=kVWiv9qr8mfW+seK55oeqju0a/Uhng8VI1B0bpXRr++gpbzod+Iw4MGTXGfQgPkTb/
         H20HC/wiGrxCx4vjVB1ErpV2+l5MdzO6REfzJpsS0QBNGeQop1G3zuejGgG4MpiUJNSs
         uBbAPev6LCNWi4aIWtRG7XL3ud5M87iPJFxnpJg2FXPYJBOEmPuUhdQUzYqIprhgYV9N
         wLau7Y9HFbvGGV/RmdrVc3SN/7e0YsBDYgAMIFICMfnLg5IL+X9JdVvw3BbW79d6f/Ur
         hlSrM6RgclZjEVNYcjavbF64hN8Zx4oYE9W6vyrNInFQiRZK0TTgtM+KAKX2HYaUCM+j
         Ockw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794998082; x=1795602882;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VbnsRzldWLp5RM4Wbi+k8602uEkMWd5FOiwEB3P+mX0=;
        b=TjxdsqsJQ/2uf7LiHsj48zMhbxJYsAEXmlZN6naE8ds2oWH5UPb7s/Nsgg5SsJgk51
         xNKIOzsYnAYdjjjMw0REzOP5AAa5+0ZtvC8zb0XKyb+bYkdIUv7uhGHsOn1i7Lcen3bP
         +Ofn//EjrYDw92Jf6Ad3m+m4Ulcu5N4d0Nft9y0hwqcSWr5uuYRIuIxlawpmPdwM/Eqi
         ACa2sMVAmSQeTiJa6nsuD+FsGr6hhWQZUqOjuVQA4wvzZQhoFHtEs/0R1gnBdowCKyFM
         s/vI67okr8utScr15T9BlPhvJL8iCQ6nCMD4kyH5QlgISR+dthCt2vrBACISTda9aiXj
         MtZA==
X-Forwarded-Encrypted: i=1; AL+hErGyUS5Btg25t5suCeDUiBwMggvn27TUSsval0n9mM0cB+B2zTJK5lxIWdF69aNLlQmLELmRua+VTpxhKRtXcNA=@lists.linux.dev
X-Gm-Message-State: APuU4Z9Jy2hlljyqsgOgcbCkve4o5L6GGKc5wTnXiUELO94y9XfGmQCU
	IoEQFRXDj3J0fa4FZMc4qHomxMEO+ieIp6lXtP8389WyQ6Za2PMjD0As
X-Gm-Gg: AZFdTZfvaCwHCb+zHy69GMqcc8IN/9SHf9x82St7Nz9szQ4Jr69AvPo6DjIysflRq23
	qzo1cd2RHHjyUa+iMdqo0IDXZj5X59oQ5fzILhzdd9Xubto48yJw7+/EVwR2ww7psncrE4oBil/
	K4om+rTT/L6zga0HO3Br1L18eLEmrrdonQHcQZXWs9DbVX2FQ2BEoxBmQBF0hQgubvLW1Wz0/yt
	CFyIgFKlT+uhI14rVS8JV0p7mJPtHA4XN6B7+U0pSCgGOBjj8Zb4ayrTWJrjBUt7aeWICHyr53r
	yLedSRALLDLjBFr5bkNQezdscN6dmD4UqvR1+Vp23M0GKzNearE/ZW2S/77j6HNmwsuw8kuIw3A
	V3TDdN8mX3f9K8cAoCrBZjbb1C/KBN5FWg0zwCAOHNVj3tJY/WtNSSnmbe05OLGBIQ0mubfvANE
	4XvRFrtyOR+mtTufzt1pr18QfFn74D6MinxBi1jip19vWqzQTUwrLJ6ABMSyHKnR1cz0evFinOc
	KuuD/Z6daZWu2a+Sj4oyYuhXzsbnsz61Y76Z3dMlNnG2Y2boVeUfmCBVI++ODxj4/S9RAM7DZnn
	OxIRB0PezwNsFFOFiBWPxPp0RPrPoePpPOrFHy01n4UPWsCvWF5FG8lmgGZZoTXmdkaV4iGAKaT
	giXJUMMlUSBmrikTZbELXC1g8Q6bPE+eyySiYkiSAuKhQDmz0Rn30qcsXztCcM4XCrTJ8LuiHdK
	I+SOFoFYiw
X-Received: by 2002:a17:903:1ae4:b0:2e9:6333:fbb7 with SMTP id d9443c01a7336-2eff756dd79mr21077005ad.51.1794998082258;
        Wed, 18 Nov 2026 02:34:42 -0800 (PST)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6184152sm10914405ad.35.2026.11.18.02.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:34:41 -0800 (PST)
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
Subject: Re: [PATCH v2] mm/damon/tests/core-kunit: add test for
 damon_call()
From: Aveline Noir <jm5905938@gmail.com>
Date: Wed, 18 Nov 2026 21:30:04 +1100
Message-Id: <179499780488.5.13594313574604410531.b4-reply@b4>
To: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
Cc: damon@lists.linux.dev, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev, sj@kernel.org
In-Reply-To: <20261118063755.37749-1-saileshnandanavanam@gmail.com>
References: <20261118063755.37749-1-saileshnandanavanam@gmail.com>
X-Mailer: b4 0.16.0

Hi Sailesh,

On Wed, 18 Nov 2026 12:07:55 +0530 Sailesh Nandanavanam wrote:

> Add a kunit test for the two cases.

Make sense. Thanks :)

Tested v2 on x86-64 QEMU with v7.4-rc3 as the base. All DAMON KUnit
tests passed.

Tested-by: Aveline Noir <jm5905938@gmail.com>
Reviewed-by: Aveline Noir <jm5905938@gmail.com>

Thanks,
Aveline Noir
