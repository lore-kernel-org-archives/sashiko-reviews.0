Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422E94398ED
	for <sashiko-reviews@lists.linux.dev>; Mon, 10 Aug 2026 18:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786387784; cv=none; b=Ih2pHpsXnqLMcjwt27MNQJqjszGw035erkGFOyIpcuTJkRRdHy0siw+TqYnD1TS67gRwPouYrjKoe9/XQjL68xfPiY9w6BD9JGgob2kwj1m0hvp85I98ApVLFrW+KVfYaEyQ9H9R424PsaqNW7lLDDjxdVFzCkZTVV4211jQ+NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786387784; c=relaxed/simple;
	bh=hAQbiBdb/L8L3hFDxA7tlwzLJflj/1mJe11rh+xIi38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tbHLoWoKXAhsMXhm7AiPimfznRljRw5CmG3yk1iEyfFjqU+O+6UaBUR5vPXJ8SSx54BVR4J+Gn/YwaFK1WyHQGsOCKcIZS/gg/Oh3CBhPW5HWWwnTu3xMYPD7zzrJAKaO+rLSR8eT1kP49LdQdJVWOcL9AoN6Hy/XsNBDBw/bB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZIfGDdTx; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZIfGDdTx"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49553515a8bso34604535e9.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 10 Aug 2026 11:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786387781; x=1786992581; darn=lists.linux.dev;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dcLbXw1HtxaVkLOq1A7ImeYJkGmUUOjnz1hGZ+5xdjY=;
        b=ZIfGDdTxH/eoURpKJJFnT+/peAHHrhSi3XE7/FQRuIVDJnw5hvqfUBjesiBuLQjUVM
         GMr1Yc4ZLEKfSecBEhpUC3nemNmpvCdfbhlXJWpmKemls3cRNI2XQ6kiGEJ6NDqZJnsy
         qfWj3dIJ6dAfH2lWaFH4aZui0eEb+ZfIiyc/y+kCNKwKmX1TxEJa7WMd8kuq+aGMAnGo
         XQTlB8sTZ/1qUTNcYsqtFL4Pql3/vOafsU/RVNEgjaID8p4gIybFkerqeazh7UO7zsBp
         t521WMSGaSROuAxxFG0EH6ZCiyaRhwOl+7mlOQXDui/awF29IZo2ZxMdeXpw4ueCFSwP
         fCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786387781; x=1786992581;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dcLbXw1HtxaVkLOq1A7ImeYJkGmUUOjnz1hGZ+5xdjY=;
        b=jEua5PSJ2lyw6Z/6B9VBKXPIdST7mSNcrHSqXAxwi+ENyoU2dKJTxyRyvG657Ms1ph
         CZkj3bQHbR72FWJDvc3xo9BKHVuL32HRTIgIxfqaauDNUN7FDJPU/gjj7m2yRQF/mRp6
         nGMKwW/bzFwJlC694YiU0aMQJ0rMpqFvLEs6GDS9TkVwUNyqMxvxEtVSyXuvoOey58P7
         5F0BATuWpvLlLXAzu6UFV3myYPlgr6/Ted65fVr8QRyj9LIhViYmJgQh1SK75mFk1IXy
         2+ehRffxPQqe5CpFomIda1afG8Coconewu8hgcHgxmfwTepeSLlarpbHe8jWSwd9yd1z
         NInw==
X-Gm-Message-State: AOJu0YzL2zG7eLpFBwMQudRs8xQlUl5blykrpq4HHONfWf8hGulNJQxC
	kFS+zKFGOwnVhZgEfLeeKL7TiMU0HKoaqLZOIku32qmPscbSqxBYfW0T4CQhwmasRs1u0g==
X-Gm-Gg: AR+sD13TLE2jLNyzmbu92logVjL8UqPnWxIQ7+nSyK7ziGZAx47z7tefElumliKjNeN
	DAP7JApHrr4v78fh7uadU3W1OqD/+24d5Kcb4pJ+ifkZNSZY2mzz+w9YRFr0BP7kvf2CCk1mFn5
	WamWfgjVrWjpwLCc9QukTkah1poPLVTEnv+lc+YQmHLEVrc57U9xNcb+m2upPW1raria0tPjMTG
	bVQ8DYWNbAEHtW7xYisEFfSUiFWMEosKNUHZwXJ1v4yC/xa+ADCTu93o53Fn6oeVSiyOA6UIHA6
	3FH4E8raSgR4OzHq678CgJ5SGWh+2dFBnn5VE85ZPAWv95l8i0zyzCFgOU9O0j76oOaoY27hhWm
	gYGZiDqFnejZI3QuqDudHA17ylBJmBkxmyblh+I4x5jnkfSdEvTQDeEa/jrEIDn/hSQjZRymuiZ
	W2Kpf01kgf4TIWGpcrTMr3n0QgVfTWF15R5J9uGzjuI+ba0BbCo2V8qTPjmwNwZ77Tk8oVBwba
X-Received: by 2002:adf:f4c9:0:b0:47f:f3f9:ae37 with SMTP id ffacd0b85a97d-47ffd21da75mr38161242f8f.7.1786387781329;
        Mon, 10 Aug 2026 11:49:41 -0700 (PDT)
Received: from strix.localnet ([197.250.226.68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48002206effsm33568215f8f.32.2026.08.10.11.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:49:40 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: sashiko-reviews@lists.linux.dev, Rob Herring <robh@kernel.org>
Cc: vkoul@kernel.org, devicetree@vger.kernel.org, lee@kernel.org,
 neil.armstrong@linaro.org, linux-phy@lists.infradead.org, olteanv@gmail.com,
 conor+dt@kernel.org, mfd@lists.linux.dev
Subject:
 Re: [PATCH v10 01/12] dt-bindings: clk: zte: Add zx297520v3 top clock and
 reset controller
Date: Mon, 10 Aug 2026 21:49:27 +0300
Message-ID: <gypuIvsORyye1Tbviu_vVQ@gmail.com>
In-Reply-To: <20260810153805.GA1793660-robh@kernel.org>
References:
 <20260810-zx29clk-v10-0-63846490712c@gmail.com>
 <20260810071224.5AA301F00A3A@smtp.kernel.org>
 <20260810153805.GA1793660-robh@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartnjexxywtRIihZLyUay2Kiw";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartnjexxywtRIihZLyUay2Kiw
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: sashiko-reviews@lists.linux.dev, Rob Herring <robh@kernel.org>
Date: Mon, 10 Aug 2026 21:49:27 +0300
Message-ID: <gypuIvsORyye1Tbviu_vVQ@gmail.com>
In-Reply-To: <20260810153805.GA1793660-robh@kernel.org>
MIME-Version: 1.0

Am Montag, 10. August 2026, 18:38:05 Ostafrikanische Zeit schrieb Rob Herring:
> On Mon, Aug 10, 2026 at 07:12:23AM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 2 potential
> > issue(s) to consider: - [Medium] Missing `resets` property definition in
> > the YAML schema. - [Medium] Missing `simple-mfd` in compatible string
> > list for syscon with children.
> Neither of these look valid to me.

Yeah, I removed the resets property in response to Krzysztof's feedback [0]. 
And the syscon-reboot is registered by the MFD driver, which in turn goes back 
to Conor's suggestion at [1].

Should I reply to the list when I think Sashiko produced a false warning? In a 
way it feels like fighting windmills, as it will likely bring up the same 
warning for further patch revisions.

It does find a lot of real problems though and as a newbie contributor I feel 
like it is a valuable tool.

Cheers,
Stefan

0: https://lore.kernel.org/linux-arm-kernel/20260717-uncovered-feathered-groundhog-eab16e@quoll/
1: https://lore.kernel.org/linux-arm-kernel/20260617-deed-snap-4649ffae0e27@spud/

--nextPartnjexxywtRIihZLyUay2Kiw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmp6HTcbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoi6FgQAKm9IYOLqegfSaVNChHC
dp6j7VY8B5nPtUGsRfYZo5T7Vf3pKufABFbR1iabCxwC2IB3jXx1qz+24mCXVDHo
XuRq29BeEeDNBoHh7GNUkTagt+HRHV79yD4tiBNvfH6Mly2NHUeIOOoZ8ZRi8TmH
I25u5EuZmqCO10wGs7DDbq5ak8DeNsQvk+MQFLxzi7DOdW6UzDv5enNFEoSPj5JW
tMuj2EoKw+LIT12rkhXAPpUroKtHknKtl+SKolXU1ZjNOgxMdIgRKd5EsTMCWqWe
Xyi47x2kKDp0a/wSX2kBMUOQZn645dEQPKyAiB7uwEBQIA8PQoxuB2+wBZqXpQ1z
PE4JW1aAPI5uo+ru6LAMss467ZiK4eejRNWoLsnyVaaO49VwtCjdQftqPI2xC/Dv
+4aDMhJWJ6+VXFLC9HMC4lz5hggYHrsLfeMARDvyt8YSRrW6+Joh6bjGx5vxt011
h/FLE4TsK++xPYar9OjtpXLNN2HPi2EBibVVWP4pXWCcm0mIuKXa3jNANUObUBAe
0z54JE4GKVlIvZTRsqUUlzk/pnQLE1KwLZ5oX4O79537YTkQzjBNmGRZh0NM1SmP
quoWwa8alZw0Eb9GRPZOFstwiFhvB9mzis3/j6KSeHekWUIyhHfrKhl9wFbezAA4
wZpFmf+iiVSkrDq/xp/ft93Y
=7cJL
-----END PGP SIGNATURE-----

--nextPartnjexxywtRIihZLyUay2Kiw--



