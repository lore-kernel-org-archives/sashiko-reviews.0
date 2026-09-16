Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8850E51E452
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 16:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789575629; cv=none; b=O8zynADNLYS0/ku5UFzegffAX624m5hYCwSooqcA81OFVAPGBQRogZXEyYX9mDxtgGKuy6y5AfLiYdI8F5hXQQhyJFW7S8Xgc/nHgEZqkmlXL2ULJpsW9mHafBrIrq486EzjWjjlATBn2V81jR+QaAVPMKIW7a5nrGsV4cWl3Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789575629; c=relaxed/simple;
	bh=UsAFZojnkBe7Pc7IV6xVMTqLnVeTSaUXZionFa6MTew=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=tlU1l2SoEqkhAet5TKumT9BjdZgqScjMfwdg4Fm3ASOMlhrS6FSoZAUNz4Rc+fVwfJy3pCczdLVPYaMCPbIxOuFyDMELXfo6oUrB1A94JEzlxFn8H5cCbMR73xLojeTqf1yQ896eJ+vCZ4LLGSnfq4dPKxwwjU2Ba3DMJ7j7Nlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=conchuod.ie; spf=pass smtp.mailfrom=conchuod.ie; dkim=pass (2048-bit key) header.d=conchuod.ie header.i=@conchuod.ie header.b=BU2cExn2; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=conchuod.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=conchuod.ie
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=conchuod.ie header.i=@conchuod.ie header.b="BU2cExn2"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f6c7a58so186374066b.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 09:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google; t=1789575625; x=1790180425; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rUKDm+AL8IancfU7CegZvxZqqpiRkJ0+AnO4LoY/TC8=;
        b=BU2cExn2Poal/DTq3M9JqMN8uGUH1Pbvu3cnvtQSssKcauDLzbnguilCAw86joz0Lr
         jqWaezYZKy7HlptA954uCio3L0A+b7frY1tUCoe3ThFFcRKDL5kIY4moy13UCNsfoey3
         UszmnSbnmHUTgEFGJWgwtzSd2KENXh6yA/aY8SI/xGPn+rAr4n7E6uRTP5iTobd131Vv
         ll+3pLTJh2hEub8xpdw5GK6C7dAJoIPQ9KWT8Bj4pq9RWI+bauq8dv6+ZyLO+mgxfyE3
         cY+RAaqHcyBWUqHrVh4AYj1m7erYvVLwSFDtev9O3Oyy4jNJXnNgQPeuT7RQX6sx6U3A
         qhkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789575625; x=1790180425;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rUKDm+AL8IancfU7CegZvxZqqpiRkJ0+AnO4LoY/TC8=;
        b=Hd6TJ65F2qJHYlyGDZB4I6tvY8gWxRnjFt/fQ5Roltn453SxSps2lycm5XfIJBIR86
         sM6Me8HQS8kOuaNpqa21Zdd2DadRhTYFDXKwW5MokZVgFUCw1C3y8dIUjCFeZwKiG9KD
         rm2QXYxDuB5Yu57tHsfutptybsx7o6kSRPbstfgZjFWyQRRqkR5u164Xy2uRX/FGEZnj
         obMCo2638VS1SSdiHDMnbicZQSs9sIQRNfcWbP6Gnitvf9pZI/4hV+I+N7ROHyLc5OjM
         3JYxmpoZ4Ea3bwO+bxWmjQUEVVonl6Krnl6Z1jA4tavPeBA8M2A1EU1YKN7+9SKWSsQP
         M0eQ==
X-Forwarded-Encrypted: i=1; AKwUvBxf/Lt5kbD846xoeuEdfJ7PZ+PDw50byrm45Fxal2//esKp8NpRpP5lQP/SeMdmPvcwpvDa9mzM9XvR3QnI6JM=@lists.linux.dev
X-Gm-Message-State: AFuF++mcS/oCIvdUsjb4cpr3jY7050VOKLsV3au/UUbSQctPpzjS/lRj
	AWNjJRXo9RceO2IW7GpBPE8NhfZ3aBOioNtq9Vv7fSDYcJeyMH8VLFTx23+XpJ7RhFs=
X-Gm-Gg: AYBFou3aUY/U8f1KYe78iQXF51b73lyG3rwraY0ZJiXLDL4fU9rVnQICGnYYs5q7WTX
	9XVioxd497Sd+UD+8m62+ELk6B1IMJ0kQLmKO/0wzv+6rNfHyxoOxxdpL/DqifDlbXrfWzduMdB
	MRJwLYxuyvZym86TnClpqEDgbFzMlUVcYn2Ip6NbzJRgq9hlNLWUK52WOiM1HD9zFh+lomAFNn5
	gFJwZwmnRbKHfNS47N+i24fLHlXeqXK3J+vAJvy4bUE6h9PvwreJl1UAZlRmTsrdnmiPMsCJbJx
	gL2QIs8wCnhzjVMOUgXkl6hOmltNWxk5u7BTJKqOn/UlEc4HfKNo+2B1VsD4Bayyv/fMAx/4Ewp
	0fReQmvPABzSpXSqK9sJ6Xkhb+gHaPMs3UD74NKfgAHrl/UDtaxv8K8ZmgvEkPDhbDCLeIYZH2r
	WkrnsGsamUPL+Tlp/+go/CxqFgkLxB7dkiK0YzRfiVz5EwrnkqUAboolYBB2gV9pNWMQqpaLc=
X-Received: by 2002:a17:907:720b:b0:c21:450d:cd7e with SMTP id a640c23a62f3a-c29e51dbef4mr252197966b.9.1789575625448;
        Wed, 16 Sep 2026 09:20:25 -0700 (PDT)
Received: from ehlo.thunderbird.net ([77.20.9.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de5b6712sm173059866b.39.2026.09.16.09.20.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 09:20:24 -0700 (PDT)
Date: Wed, 16 Sep 2026 18:20:22 +0200
From: Conor <mail@conchuod.ie>
To: Andre Przywara <andre.przywara@arm.com>, Conor Dooley <conor@kernel.org>
CC: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev, robh@kernel.org,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, conor+dt@kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: arm: sunxi: Add two Teclast tablets
User-Agent: K-9 Mail for Android
In-Reply-To: <20260915230127.7aa4386a@ryzen.lan>
References: <20260914210115.28151-1-andre.przywara@arm.com> <20260914210115.28151-3-andre.przywara@arm.com> <20260914211940.256A11F000FF@smtp.kernel.org> <20260915005122.40ba2d7a@ryzen.lan> <20260915-flip-steadfast-9198d002f381@spud> <20260915230127.7aa4386a@ryzen.lan>
Message-ID: <04140E55-E1FF-4B8E-8213-154B588E9E2A@conchuod.ie>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 15 September 2026 23:01:27 GMT+02:00, Andre Przywara <andre=2Eprzywara@=
arm=2Ecom> wrote:
>On Tue, 15 Sep 2026 17:58:50 +0100
>Conor Dooley <conor@kernel=2Eorg> wrote:
>
>Hi Conor,
>
>> On Tue, Sep 15, 2026 at 12:51:22AM +0200, Andre Przywara wrote:
>> > On Mon, 14 Sep 2026 21:19:39 +0000
>> > sashiko-bot@kernel=2Eorg wrote:
>> >=20
>> > > Thank you for your contribution! Sashiko AI review found 1 potentia=
l issue(s) to consider:
>> > > - [High] Missing SoC fallback compatible string 'allwinner,sun50i-a=
100' for the Teclast P80 tablet breaks CPU frequency scaling=2E
>> >=20
>> > Well, there is more to it=2E We should rather add the a133 as an expl=
icit
>> > name in the driver, like we did for the H616 family=2E And the whole =
OPP
>> > table is still from the old A100 days, it doesn't really cover the A1=
33
>> > or A133P values, which go up to 1=2E6GHz and 2=2E0 GHz, respectively=
=2E
>> > The bin selection in the driver is also not adequate, the BSP code
>> > seems to use the SID cell at 0x00 to select one of two speed bins, at
>> > least for the A133=2E The A133P is probably still different=2E
>> >=20
>> > So I'd rather keep the a133 fallback compatible, and adjust the drive=
r=2E
>>=20
>> Can you explain the complaint from Sashiko to me?
>> From where I am sitting, without awareness of allwinner SKUs, it seems
>> like the bot is suggesting that you add a "random" fallback to make a
>> driver probe=2E
>
>Well, this is about the DVFS driver, which doesn't really have a nice
>device to match against=2E The nodes under /cpus carry the cores, but
>there is no notion of a SoC here, it's just about architectural Arm
>cores=2E So the solution was to match this against the machine (fallback)
>compatible, which always carries the SoC name=2E I think other platforms
>do the same=2E

Yeah, I get this part=2E

>And while we have DVFS support for the A133, this only supports the
>"allwinner,sun50i-a100" fallback string, as this was the only chip of
>that "family" at time of upstreaming=2E The A133 is using the same
>die, it's just a better bin, but there are virtually no A100 devices out
>there, as they were superseded by the A133 very quickly=2E
>
>So what Sashiko (somewhat correctly) mentions is that with that
>a100 fallback string we won't get DVFS support=2E It feels odd to name
>that tablet A100 when it's clearly not, so I went with the proper SoC
>name=2E
>We did the same for the H616 family: just adding all the names using
>the same die to the DVFS driver will solve this problem as well, which
>is what I am planning to do - unless people have different opinions=2E
>
>Hope that helps!

So yeah, it bottles down to Sashiko suggesting that you use in invalid fal=
lback given you mention a different programming model, although mitigated s=
omewhat by the fact that a100 is a worse binning and is probably compatible=
 outside of dvfs=2E
I'm just very wary of what sort of garbage that Sashiko will tell contribu=
tors that, unlike you, don't know enough to realise what it is telling them=
 is wrong=2E

(Sent from my k9mail, hopefully formatting didn't get screwed up)=2E
Conor=2E

>
>Cheers,
>Andre
>
>
>
>> >=20
>> > Cheers,
>> > Andre
>> >=20
>> > > --
>> > >=20
>> > > commit 582b866f1ad9000afddf47eb7e4c9d37a95dfbc8
>> > > Author: Andre Przywara <andre=2Eprzywara@arm=2Ecom>
>> > >=20
>> > > dt-bindings: arm: sunxi: Add two Teclast tablets
>> > >=20
>> > > This commit adds devicetree bindings for the Teclast P80 and P85T t=
ablets=2E
>> > > The Teclast P80 is based on the Allwinner A133 SoC, and the P85T us=
es the
>> > > Allwinner A523 SoC=2E
>> > >=20
>> > > > diff --git a/Documentation/devicetree/bindings/arm/sunxi=2Eyaml b=
/Documentation/devicetree/bindings/arm/sunxi=2Eyaml
>> > > > index f04db28c630ac=2E=2E28437c47ac01b 100644
>> > > > --- a/Documentation/devicetree/bindings/arm/sunxi=2Eyaml
>> > > > +++ b/Documentation/devicetree/bindings/arm/sunxi=2Eyaml
>> > > > @@ -933,6 +933,16 @@ properties:
>> > >=20
>> > > [ =2E=2E=2E ]
>> > >=20
>> > > > +      - description: Teclast P80 Tablet
>> > > > +        items:
>> > > > +          - const: teclast,p80
>> > > > +          - const: allwinner,sun50i-a133
>> > >=20
>> > > [Severity: High]
>> > > Does this strict two-item compatible array omit the necessary fallb=
ack string?
>> > >=20
>> > > The sun50i-cpufreq-nvmem driver in drivers/cpufreq/sun50i-cpufreq-n=
vmem=2Ec
>> > > requires allwinner,sun50i-a100 to exist in the root node's compatib=
le array
>> > > to bind via of_machine_device_match(sun50i_cpufreq_match_list)=2E
>> > >=20
>> > > Without this fallback string included in the bindings (and subseque=
ntly the
>> > > board's Device Tree), cpufreq-dt will not be instantiated=2E This w=
ill cause
>> > > CPU frequency scaling to silently fail on the Teclast P80 tablet, l=
eaving
>> > > the system stuck at the bootloader-configured frequency=2E
>> > >=20
>> > > > +
>> > > > +      - description: Teclast P85T Tablet
>> > > > +        items:
>> > > > +          - const: teclast,p85t
>> > > > +          - const: allwinner,sun55i-a523
>> > > > +
>> > >=20
>> >=20
>
