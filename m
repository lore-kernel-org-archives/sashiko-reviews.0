Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CF73DEAEC
	for <sashiko-reviews@lists.linux.dev>; Fri,  4 Sep 2026 08:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788509553; cv=none; b=ERnFyekqMIDJ3YxQ3fYvGj4FtYVAGZMRe0rg2FvpyRn/lvWsUTAG2l8L43z+sM6VOD9IVMzCpT1ppEyuyY9HbNui6xK8gKjg+c3IsK/GZ7pdHLDwvpMJGoHZX1QyHdL0qbX716y7KgEubFJE0j+59ZfTYxdrrQZhFDQgqrWGKN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788509553; c=relaxed/simple;
	bh=vpR0KuN+ln6lHcQtjSULttF6OUz2pD2N1HwMAgl0w3Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UcUx9SUG04uuIdZl11rRmm/6dQAno70zCrJL+XfzfMwVLHmaAW2G8klx3xMOf9N52Y5KvS/jr328Zx81FXGYNCqSxoRT/CkRiSkVhD49PwOQ0TtUqVYkW0kOVxZAk0PBQy/GZ+ujP+jp4QpyHlYdqtB+epPpTRH6lqnE+BtnKr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=H7tIUlEe; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="H7tIUlEe"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso5840855e9.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 04 Sep 2026 01:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788509547; x=1789114347; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TjS/Wss53RdL4gmLmah8vA+JE9KhD5i1oEQt4QZujmE=;
        b=H7tIUlEeQqdgE3DnRhJeqvixVXkWZM4O09g8y/8NmPkAgqXtvpK8MO+kFnWWL7+DCi
         bi0touVhoPNpw+njZTn0BRIgBNakAtmPK8PuBBIFau+sYnrflP12hBU/XhOQDBgetvrd
         F2TJhyhrlFCSPcUoqh+w9quI5XBvd8crfkpq6Hzi6dr55ZtjWL+zUk6Wu1Bu2aDUzWp+
         ugBDWBhYjX94X5pL+O39Vata72blinc6NH4qHBleHcKF42dSyHVyvKecW1Z4A1xSL9NS
         6/Q0Kd4Vk8+35GgeqOKYbud3+J7V6H8PBxBXJ97dphyUPcGUNxd8RG1sdT4sjI4wD0wi
         XRIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788509547; x=1789114347;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TjS/Wss53RdL4gmLmah8vA+JE9KhD5i1oEQt4QZujmE=;
        b=W5nZIBIS8zGwApLNEKo6FMIN/kfPNXXyLAceLap5GZOzjOII6Fegk6TUJyjNEmd6Of
         moDj6tb0RMAwdcmfePXDNNzjJiqxSnLwyneFebE91X2dJ4qToSXEXMDumDsQtkL2nYn+
         QC5a266+bABxPur+216uFa3vlLFaYIlwq3AVSJpkYC1GAZXQk22soZpJWkRAJvJVYsPZ
         e8FKHQcPwkk0NAo1mue5IqkP8Zsz4KP5DdVqT+4+TQIYlH8GQ2PGyQx2zlKOWFwd8ir1
         0vPz9i7KFAbp2JEtHhiAnL4VnIhmrFguKV28fg2Nh6H6AOlmCzz/AFdr4ocVCSgg1x1F
         NV8A==
X-Gm-Message-State: AFuF++kk3YILeq7LwAsXHzVEmZSSCo2UJcLb1Ngr/zNX+o9tBAEBviIh
	gOtz1sjUGRTaV/miDxbJDcyDu6/kAKHq445/WZ1EWIAOyRQvpSaWlHuWlkRmrsZToszZBbNiGpc
	R4fbAerY=
X-Gm-Gg: AYBFou3f4HmXYV7UTIQt1yF0fj3cOP7FKGLKuQ6s5rK++Tww0IvxszGXPv5h1rg3gjM
	nM78O4stoGzDdepNV2c+uaBAcOn460vzlHwPeqshV2g3h64HJ3rezLGLK8SLn8tw+ArHIcSojBN
	wipqYgJIDCjajAhgPyUn87KdUV5V1FhqPPb2QGHnl5l7gtv5IksITXLCng1sKbdymo69m0TVhkN
	+Mkh9iZAN5wMIXgHuEVnfFlf79ugy1zew1/77XEoyb1rTzCoiNCCxFbZsj0PHoFazkYiErBElZg
	5iS+mpcqLu2Qu3p4vKpadaMIFOMt7fYCUJwA8QinzyQnDVvW5OKMjwkoyDYsyfLmCeKkxFdbtoJ
	mJIU3cjbcUrN4TgHttGV8idRR/HReDDAMmyhfnK7AMwotj3rRJn64l/ueFQm2GOs/zcB1wthzy3
	899nJCwul6CCasR9IeYlT1387hSwU3IsdFJA2frAbZAAl47TB9ycfMLGEkAggWDfjkfDyMcQJFT
	D9UISs=
X-Received: by 2002:a05:600c:3b07:b0:49c:fa20:cbfb with SMTP id 5b1f17b1804b1-49cfa20cd04mr23123115e9.18.1788509547190;
        Fri, 04 Sep 2026 01:12:27 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f8192sm11446335e9.3.2026.09.04.01.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:12:26 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: sashiko-reviews@lists.linux.dev, Onur =?utf-8?Q?=C3=96zkan?=
 <work@onurozkan.dev>
Cc: linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: devres: make clock cleanup explicit on failure
In-Reply-To: <20260904080129.A84381F00A3E@smtp.kernel.org>
References: <20260904075026.60793-1-work@onurozkan.dev>
 <20260904080129.A84381F00A3E@smtp.kernel.org>
Date: Fri, 04 Sep 2026 10:12:25 +0200
Message-ID: <1jld9hl9jq.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On ven. 04 sept. 2026 at 08:01, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] Replaces devm_add_action_or_reset() with open-coded error handlin=
g to pacify a static analyzer.
> --
>
> commit f91fcabb46a07cc1fa1a03a8bac1f236304fd974
> Author: Onur =C3=96zkan <work@onurozkan.dev>
> Subject: clk: devres: make clock cleanup explicit on failure
>
> This commit replaces the standard devm_add_action_or_reset() helper with
> devm_add_action() and an explicitly open-coded clock disable and unprepare
> sequence on failure. This change was made to address a smatch warning.
>
> Link: https://lore.kernel.org/all/apmUPdYtdIM0dQbF@redhat.com
> Closes: https://lore.kernel.org/r/202608090025.dwxdfqFr-lkp@intel.com

Note that when you are fixing something, it usually needs a Fixes tag too.

>
>> diff --git a/drivers/clk/clk-devres.c b/drivers/clk/clk-devres.c
>> index 4cc3863bd7da9..9ed9a7b7b23f4 100644
>> --- a/drivers/clk/clk-devres.c
>> +++ b/drivers/clk/clk-devres.c
>> @@ -123,9 +123,11 @@ struct clk *devm_clk_get_optional_enabled_with_rate=
(struct device *dev,
>>  	if (ret)
>>  		goto out_put_clk;
>>=20=20
>> -	ret =3D devm_add_action_or_reset(dev, devm_clk_disable_unprepare, clk);
>> -	if (ret)
>> +	ret =3D devm_add_action(dev, devm_clk_disable_unprepare, clk);
>> +	if (ret) {
>> +		clk_disable_unprepare(clk);
>>  		goto out_put_clk;
>> +	}
>
> [Severity: Low]
> Is it necessary to open-code this cleanup logic in
> devm_clk_get_optional_enabled_with_rate() just to satisfy a static analyz=
er?
>
> Replacing standard kernel abstractions like devm_add_action_or_reset() wi=
th
> manual error handling to pacify a false positive degrades code structure =
and
> reverts the benefits of the devres pattern.
>
> Should the analyzer be fixed instead of open-coding the manual cleanup
> sequence here?

I tend to agree. If we are missing something, please ellaborate.

>
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904075026.60=
793-1-work@onurozkan.dev?part=3D1

--=20
Jerome
