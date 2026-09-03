Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B704A5C4A
	for <sashiko-reviews@lists.linux.dev>; Thu,  3 Sep 2026 12:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788439274; cv=none; b=BbPOslHSjMqX6qKL+Rm7VrF4IaPBW/PfamdEo/b+eAf5kX7qGmfC796FG1GdrXe8VY7iNgSDffvJaEBQZ2yufqD6LABYaJ2S2nQ0JffVKLHfPtxmqoup/S0l10OP6T8lQIJB31S/zGowl/DtMnOXeqQwKydq1Y249b3kc5CoWuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788439274; c=relaxed/simple;
	bh=sOT52DbKgvkkHbkje73zUdH0VXn9AYdlxPV7LsvQoaI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iQtpy8AjI5YJKRqlgwPqxqPb0KM2FTm3tBAYcE21AdM9lxKH2y1+X50PIP4Daedcwlpj8GhxYTrD6EsXz1h1aLOs1NEHjEslsRZkKx9P7mxrTQabewpEpv5EGrCwKCIC7o1ZSd85NoUlqVTqV6Q0651WdiqEd0asNiM+WAE2Ac0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=kijQavFP; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="kijQavFP"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49cd9add88aso14828735e9.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 03 Sep 2026 05:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788439271; x=1789044071; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+iNE6mGIoSx/OllUwsSZWUgexqjjfHjOUITVK9fxSRA=;
        b=kijQavFPCkRHy9IVY6ngr5StUgHyzqaNyIdGmTFX26AmTiSAc7LVTWTTZ1tlSRft9g
         8PAbFEatyT+yGA/TDjtwVgK5DkHzeden85xSK3JFwDum+mvg2Tly6mzsSLdiPL8F/BUE
         6GHX7DalmmWUVuvx1G8unXXzydJcEQA3/rAp5hPxHG2ErEt3Wga0VMXR+/zMnBveeKyX
         hMCD3vv1ACs7OSy/bwpjJ7/fTIZ6Xb+gSrdB33m/C6Ya9p/WPH2FKZsPE6V3OhYdBuzZ
         36AQ1Nf3RmpHkUpElENZmY5o8oBrKO4kmYjaKoeoP0SV6i95Ibszg681TqOqMdj+bVNz
         ATIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439271; x=1789044071;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+iNE6mGIoSx/OllUwsSZWUgexqjjfHjOUITVK9fxSRA=;
        b=Kw8fDUR36a7FEmWkBnnB40meVNOoj4sQIm7mn3DuYOjmC+f8x8LwO6elbpr+nsoD2u
         C4eCo0pdHxS+41Rs1m66oFZKGarQbRNwK3OaZ+CCTZu/mGZMMajs0aMI0QBGcazaZDcO
         5SsjCgrklZXNOJr2rGDm3Evk1AKWM/AuP8bSZ6AphEii1kZCEx6WblWPWiqI58/Dubh+
         kGr3XeToAwlVD81sQy8EpZBDDSlG/BEdSoBhaIcB/nsDZ+gXQGXterWxSlmYAYObT4eh
         mtAo65IPG4zqAEk/Acbg4AVPUashjHhD5/FW+V9gNVQ6b76pTLHGNYzONteac9Xxvpbi
         Nz6A==
X-Forwarded-Encrypted: i=1; AKwUvBzqPgbsX1Hf8QHvz9wHfh09JGri0Fsc8WjPHCN7jQ2rakRtWPiAbz9KB+zJLdyfi0UqWZiEy3IXJwNFAU2hvrw=@lists.linux.dev
X-Gm-Message-State: AFuF++lIICd0JF15TN7xJGzskeGJ/imtUo9xuoXlNd8sj1Ju5CMDD6oc
	0eGprOEpo9ujcJj8XGW/w9OSgUfkikpjSPGPW2YNmxl+cRb41m1GkaNtr5MChGIBsAg=
X-Gm-Gg: AYBFou2IYmHngb5tLQeHgEGo/MtIn0Mq97WL9mas0Q8kY5X+X+NF+8D+Kmz+77u8diB
	cHSdfA+Wxzfz2bZC2e2BN3O5PzvVGtNNt0gMLy2DP66cTuh5+bV7SUETlYjgecWpr2+809zEEdL
	pc50XouWa30hVru2G05tzfXlcTKxAggp4LvJPEPMZVEuJXArWXSTMh/kc3EEYyULSkRREj6al/8
	999HUFDGaPIpq6KJqi4XKiuZwsE3d6YwHOI/M+/XWR5Nn0CGMT87bNlbYTdeZXZ8LuYvD9I7SG9
	UtCol35XDr+rS+f84CBuoSRbbMOE+2oKJzGUb8VXuM8UCHFbS9iWj6ggpRmNtMlo6aRcJLM0aUF
	FsI3K+1gjbXA6VkyXfOyp7DE4ZPuoP0Q8xIm6p9/aSokt8DvZrmmcGHtdV7zleK3uWw0jT60ExG
	RbyyGRLvv/kkkZMIei2/N8fLBr/u5XAkGMfl+9XdVDDz5zDSusFP1SBVlhLCf8BTpd7aq2K0Prf
	eyV+lo=
X-Received: by 2002:a7b:ca42:0:b0:49b:92df:87be with SMTP id 5b1f17b1804b1-49ce55fbdbemr151563565e9.4.1788439271011;
        Thu, 03 Sep 2026 05:41:11 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e80798sm12957979f8f.13.2026.09.03.05.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:41:10 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: sashiko-bot@kernel.org, Mark Brown <broonie@kernel.org>,
 sashiko-reviews@lists.linux.dev, robh@kernel.org, mfd@lists.linux.dev,
 conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND v6 4/5] mfd: axp20x: Add support for AXP318W PMIC
In-Reply-To: <20260903090328.GH2133376@google.com>
References: <20260812-axp318-regulator-v6-0-d6b84b55c000@baylibre.com>
 <20260812-axp318-regulator-v6-4-d6b84b55c000@baylibre.com>
 <20260812214019.CDF921F000E9@smtp.kernel.org>
 <1jldaafmpd.fsf@starbuckisacylon.baylibre.com>
 <20260813095600.GA1072730@google.com>
 <1j33wg6cpk.fsf@starbuckisacylon.baylibre.com>
 <20260827134235.GN770273@google.com>
 <1jld9j8pfg.fsf@starbuckisacylon.baylibre.com>
 <20260903090328.GH2133376@google.com>
Date: Thu, 03 Sep 2026 14:41:08 +0200
Message-ID: <1jh5k68q3f.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On jeu. 03 sept. 2026 at 10:03, Lee Jones <lee@kernel.org> wrote:

> On Wed, 02 Sep 2026, Jerome Brunet wrote:
>
>> On jeu. 27 ao=C3=BBt 2026 at 14:42, Lee Jones <lee@kernel.org> wrote:
>>=20
>> > On Fri, 14 Aug 2026, Jerome Brunet wrote:
>> >
>> >> On dim. 13 janv. 2008 at 11:56, Lee Jones <lee@kernel.org> wrote:
>> >>=20
>> >> > On Thu, 13 Aug 2026, Jerome Brunet wrote:
>> >> >
>> >> >> On sam. 12 janv. 2008 at 23:40, sashiko-bot@kernel.org wrote:
>> >> >>=20
>> >> >> > Thank you for your contribution! Sashiko AI review found 2 poten=
tial issue(s) to consider:
>> >> >> > - [High] The corresponding regulator driver lacks support for
>> >> >> > `AXP318_ID`, causing the `axp20x-regulator` child device probe t=
o fail.
>> >> >>=20
>> >> >> Funny sashiko did not pick up on this when v6 was first sent. This=
 is an
>> >> >> ordering problem. The regulator part should be applied before the =
mfd
>> >> >> one.
>> >> >>=20
>> >> >> I could reorder here but there is not much point since the 2 chang=
es will
>> >> >> land in different subsystems but it does bring a valid question:
>> >> >>=20
>> >> >> Lee, Mark, are you OK with picking the patches indended for your
>> >> >> subsystem or would you prefer that I split the series, regulator o=
n one
>> >> >> side, mfd on the other (with a dep on the regulator one, of course=
) ?
>> >> >
>> >> > Does this break existing devices or simply delay support for this n=
ew one?
>> >>=20
>> >> Existing device are fine and untouched.
>> >>=20
>> >> I've just checked and if someone tried to run without PATCH 5 (regula=
tors),
>> >> the main axp driver loads fine but the regulator part gives this
>> >>=20
>> >> axp20x-regulator axp20x-regulator.0: Unsupported AXP variant: 8
>> >
>> > Can you not enforce the deps with Kconfig?
>>=20
>> This is not a build problem so I do not think Kconfig will change
>> anything here. There is no specific config per chip.
>>=20
>> It is just a runtime ordering matter and not a problem. regulator and
>> mfd are split so at some point the support is incomplete.
>>=20
>> * MFD first, it is fine it just cant instantiate the regulator until it
>>   lands. it is (mostly) useless without it, which is fine.
>> * Regulator first. regulator will never be instanciate until MFD support
>>   lands, just as useless.
>
> Okay, this is normal.  So there are no deps between them?
>

I think it is normal yes.

There is a dependency as it stands. mfd change (PATCH 4) introduce a
header it uses. The header is also used in the regulator change
(PATCH 5).

I don't think the headers should be split in there own change
but I can do it if you want.

> --=20
> Lee Jones

--=20
Jerome
