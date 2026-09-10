Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AFB453A5E
	for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 10:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789036670; cv=none; b=qOFemAYzTp7yw5FGyl5OePbUYOQDJJRI2RBUZY1MW+/3ZHfEZi0wsw++vN21IiQPtSnnldrQDlX2nBHorSoFrvfs3LNkpjmN0UgeaKeL4m2RPNxYrOKbBNLH4S4jr98/sRUHeUdI0QuqH0uyWQ0W20AD81+c4C4LF4JsxYnYml4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789036670; c=relaxed/simple;
	bh=rMU+PmTBon7MZYNFvL/32kuzRyhojyfvr5NuoahMVyA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=scAiK61XxhpU6SzeGFUcCj6zBpeNEYCaOb7tJ+5N4fA7mXAfXvlLa8ukW18X8cIy2LAcBAC6Chv2QFxJdlR1eJmu0uOeD6bDkmBPLzHFNfQ9fvJxKYEoSlV8DRHnYyJaD9QSX+vHPGbWohxpZKVsZK1KAUKjdV+/Ha/OA8O9rfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Vzla2Mgk; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Vzla2Mgk"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f62ccdb1so1049223f8f.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 03:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789036664; x=1789641464; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6EF+UHNSS4hI0lePcCf3NeWVNl/rHsUyRzTVnqSXcQw=;
        b=Vzla2MgkcZ3OWISQaKcUST+UL0tIA6QJtHXx8I3lJxL5F9Tm/rWNrfWHCyuFPzN7Uy
         MbQeDDhqr8hXl77oqSn0ItosBViTo7cjDVFU29Qqil+xC+2cLZXq7mWoEWyQ+ZikRzXh
         0JMJZ8R9dvMphlUfjJbzTK4QcFgGd1nDe/AIY0u5NvoBKGmQdbxel+P6Wm7bkC/VuhKw
         giRQxgkN7W2TycD+zyjaSFOjMakrG4LYxT/uOCSloWkRChsuOtCOKoxtElAo4bnhsmpt
         kH73T6lKXQLgYvL5B6J99bF+rVKGKTuy3/yrrb4bn4BKIaKoWUUUTu7peaqCxNTV6bwe
         3LLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789036664; x=1789641464;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6EF+UHNSS4hI0lePcCf3NeWVNl/rHsUyRzTVnqSXcQw=;
        b=LzKSIw0c+hamDiz2BTgw52tDsK5g2loak12d/C/W4d42Vp93hu1C+IPCAFHk3IVN9N
         zB0ja75XG9KMjPVvYk+lcGDB5nydryU9OvPQv7Vfp+5yupSSOs2As5TFuWtzQXLKV1+t
         yBM8IPyEbgfASoGKGPcJJu7A0UWi2rC7BU0UXZCEkCh6LpV00pe/on7DhNH1vQAVlDZt
         GClhkbXIW0kGAOsSQVp3OU8JrRFfcKvEpFnvLTC2lLAa5dG+WxnYCEBwbRTJKID5T4QX
         5AFE06Hh6pHKfITzkIiyrhrEQnUpMZVJjpbApcsdo1EFSbHrBftWaWmGqw7w+pXv8YYZ
         6mGg==
X-Gm-Message-State: AFuF++laME2OgEstooFwHpdyHCYPrGV5BmFs+J4hThVIM7YTxWvxAr/7
	wNcN9jmbsFu7D+43kfqBuhtdQ8urNm44d6FX/DT4XAVi1zeZNPDSUvcx1FQA+FaVuEmvT7N4Oz0
	1L4ThKU8=
X-Gm-Gg: AYBFou28eIJ7WCuVES5Ko5e8ZKjUx8t3AnbAzDs2bWWiM25L1ykYJM3K9XUHH1QKQow
	UladHLPW2AcUojofr+J2Ahdb+XWgiZPyBCOfkc/A9NWOhIwhZZYiOn3aMcNHALdkgi3Y2NJcF1J
	VhE+3sXN0aVzDF3ArNmWmtuIc8tdDIF+Ab23CYFkTBNI913Beeeb4uECvx8QRZj7WFoODudorz0
	bpE1JKPnJreJqvRrYphjXzSR7aq6mZepq1B6McSpFaqdx4qXy0Zmvtc5rsBA6w3wTB/J1wqmYo9
	flJc76IHUrOcQ4PPPUybB8fx2NO38YeZXQVhwvTHk1i/Ld0eeyUQ+E52tjl5EglHGHQvjIBcf0A
	9UnlEwY3Ee7dulis/tUnhQ7J31FLKlP5yV94L8iLxUYDldwSGtyJFH3PTY2Tqj/V80W/P4Y/DMw
	Eg1g4xpZbFxnpC0IyPPZOKa6lOi5DeM3p/+TbgDVyDQw2sckH/nfa7NEhv2xJvw2WDerI7sFFwk
	UwA2ZsOe5oLQiZ7tw==
X-Received: by 2002:a05:6000:24c1:b0:484:482d:dce4 with SMTP id ffacd0b85a97d-486d7322325mr4803704f8f.0.1789036664113;
        Thu, 10 Sep 2026 03:37:44 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ab73c2bsm48835518f8f.22.2026.09.10.03.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 03:37:43 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-sunxi@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org,
 mfd@lists.linux.dev, lee@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 3/5] dt-bindings: mfd: x-powers,axp152: Document AXP318W
In-Reply-To: <20260910094251.A112A1F000FF@smtp.kernel.org>
References: <20260910-axp318-regulator-v7-0-de720ceb9bac@baylibre.com>
 <20260910-axp318-regulator-v7-3-de720ceb9bac@baylibre.com>
 <20260910094251.A112A1F000FF@smtp.kernel.org>
Date: Thu, 10 Sep 2026 12:37:42 +0200
Message-ID: <1jtsnx75op.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On jeu. 10 sept. 2026 at 09:42, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The new `x-powers,axp318w` compatible string is omitted from t=
he conditional block that makes the `interrupts` property optional for rece=
nt generation PMICs.
> --
>
> commit e4119d6ce87c67baf660bd6f040790fb69b77af3
> Author: Andre Przywara <andre.przywara@arm.com>
>
> dt-bindings: mfd: x-powers,axp152: Document AXP318W
>
> This commit adds the compatible string x-powers,axp318w for the AXP318W P=
MIC
> to the binding schema. It also adds new input supply properties and updat=
es
> the regex for matching switched output nodes.
>
>> diff --git a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml =
b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
>> index 45f015d63df16..38556c32417b3 100644
>> --- a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
>> +++ b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
>> @@ -83,6 +83,7 @@ allOf:
>>            contains:
>>              enum:
>>                - x-powers,axp313a
>> +              - x-powers,axp318w
>>                - x-powers,axp323
>>                - x-powers,axp15060
>>                - x-powers,axp717
>
> [Severity: Medium]
> Does the x-powers,axp318w compatible string also need to be added to the
> earlier if-then block that governs the interrupts requirement?

Ahhh, got it the other way around first time this poped - resending ...

>
> Just above this hunk in Documentation/devicetree/bindings/mfd/x-powers,ax=
p152.yaml,
> there is a block that makes interrupts mandatory for all PMICs except a s=
elect
> few:
>
>   - if:
>       not:
>         properties:
>           compatible:
>             contains:
>               enum:
>                 - x-powers,axp15060
>                 - x-powers,axp305
>                 - x-powers,axp313a
>                 - x-powers,axp323
>
>     then:
>       required:
>         - interrupts
>
> By omitting x-powers,axp318w from this enum, the interrupts property is
> mandatory for the new PMIC. Could this cause device trees with an unconne=
cted
> AXP318W interrupt line to falsely fail dt_binding_check validation, given=
 that
> similar recent generation PMICs operate fine without it?
>
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-axp318-r=
egulator-v7-0-de720ceb9bac@baylibre.com?part=3D3

--=20
Jerome
