Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D333E1E0E14
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 02:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784602314; cv=none; b=b/qrBQ4aNmOhHs0rQA7wUBJivL8cDxoAPPHU9PzS/BGaOktmkQTu2ppLWfXgnrwK5LgO3DmstTrucKecrlD9p1ueGkgr2FxvRLqZ/f24NBWYQ77FqGXOOZOT14duxiExgFzqltYIX1Rn2Xu3Phk1Xx/0CXWjd2w8gJSEA0JuqLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784602314; c=relaxed/simple;
	bh=YJsPImwprWYdEz+ZKXaVKQBIP8+D5IdSIcmr1UJr7mg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=cykbGd9nniU/haX3/ySIic2bigAtS7QJPMKwbI8QZSFPgs01tEOgFSVMLRSgA3O9Hw8t8JmliXA8Rf4DFOE37MjnxohDX6we5ZgA86PzuOZLrKF+iTpNQa2tNYL14KhDIDNmRdmFy5Xce0sMYdfMLzT5zUctgv3Z2+lzSEAOFos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=Bi8doPAr; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="Bi8doPAr"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c99eaa1f020so7450654a12.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 19:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1784602312; x=1785207112; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/+DBEPr4uWvMVbIBmyNdw6JZxEfO9MH/309T1HE5nyg=;
        b=Bi8doPArf26vcK5Cs4JKJTg3YV1mlklD9vNttHWalm4dJIotdyzfPDx0vOPFHD6T6A
         3ZXiTT8AE6zZ554ZHFHFg9rD/03u6WUhs5TW+/zhwg9TRVOSsSQt3fBGJnprZRurCHrS
         cKQfzEPfwxdJ0bF+7XVSpC6A62S9NynOI9NQyMHbE/Z3KMtDpnvNV5i4cA92QSYQ4RR2
         sV0AAO3PWd2jtKTOTlQfnaQLsNzyHd7b+yJK0NDfxLd2bVOJ5Kd9ILRRBgSQbPhj3U1Y
         GmTFQZQ9eiHdik1/F2wS2S2F4Qh2s0MlCHZdVywU7QNALOPaKkttcuppQ/JYT785eWB2
         kdKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784602312; x=1785207112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/+DBEPr4uWvMVbIBmyNdw6JZxEfO9MH/309T1HE5nyg=;
        b=Y4nKzuVBax5xZZnTjrauyZ7LduqTBNHzktpIJxPp/kZmvN6d7ELJfFfvyeaE5HgGYv
         RMfNSNBNSUiXPcXsrtQ/v4hKvrutAWHWcaCpKlLwDTn8X1bHCS4cGGGDdBDCi/nTbUVR
         g+dzTX+YQANAkDMhJkk85QUTKqz3tJrk/4rEAo4wa85WFi+hbM+IeRkpaxvU+NfJ++ZH
         eEu8uaiM1ND7JXxUIIp5bYG/ppYFZgRfXm6jRwWddvq2gl1AaSLSKHCrSN6ffQOdxhhg
         d9mUaTOFdz6Gd878qn8CliKoaf/kLQcGa6vh/Zyc/eda0nHPGhbZsj4skenHXv1vPgSM
         Uk8A==
X-Gm-Message-State: AOJu0YxfBkzkDXK7FVSk6/X6508T+7ReZjsRJI+9ls3c/SUcY1dy7adi
	A8r3wun5hoAIQU7UygWXCyj2qn2+AVuWdikz1fFMe+CUhqIGP/5+CpEhCy/1jd/IuHuuc8NpeAm
	CQtNt9CQ=
X-Gm-Gg: AfdE7cntaKTdROKy4IAdIVTgXBcD835MmFX7VOt3fD8pySetX+h42iC9Zqj9xakRxAP
	SD4pCGt9I6ddyrgFsGmWK63HguB0Pid2RXg5flaK+KD31UzCaNSGnkLUWdF14Up7RAlQ6Pn+tOi
	darLehwdiYjnRJamTtZKwNWmYd6/1TGK8glr6jJ+iRSasX1a7YpqaCFm9g1ZmgUBHvU4+42IdKp
	7no1vR4xQWDVPIxqiLYO786IGwLBwLMdW69WmiZBLJgaRluZxIIFcDDMxmbRNSuE6ttxCF4bU8e
	rh1deYUaxaQkRn8gKseBa/FJux2BuW5AnAJjjnrAJ+DT92YPBFWX87YzH27PMygF7tj+hYnRtIj
	R6bhCIUTtuN7RtHHSd31V8gY8/IPT5v83IU+/EO0U0phHK93CBYixkO16DKMODc/4ldh2w2PvAs
	XKoQ==
X-Received: by 2002:a05:6a21:6e4c:b0:3c3:7cd0:fc2e with SMTP id adf61e73a8af0-3c3ad8ecc7amr18216306637.48.1784602312235;
        Mon, 20 Jul 2026 19:51:52 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1bb77csm46116476eec.18.2026.07.20.19.51.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 19:51:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Jul 2026 19:51:51 -0700
Message-Id: <DK3WPZU35H6J.10Q15VPVXDWNC@nexthop.ai>
Cc: <conor+dt@kernel.org>, <robh@kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH RFC 4/4] of: unittest: cover /aliases updates from
 overlay apply/revert
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: <sashiko-reviews@lists.linux.dev>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>
X-Mailer: aerc 0.21.0
References: <20260720-nh-of-alias-overlay-v1-0-f1e5d9889b30@nexthop.ai>
 <20260720-nh-of-alias-overlay-v1-4-f1e5d9889b30@nexthop.ai>
 <20260720071020.4E1C61F000E9@smtp.kernel.org>
In-Reply-To: <20260720071020.4E1C61F000E9@smtp.kernel.org>

On Mon Jul 20, 2026 at 12:10 AM PDT, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] The test claims to exercise patch 2's logic but bypasses it by=
 passing NULL for target_base.
> - [Medium] The test claims to exercise patch 3's logic but bypasses it by=
 using an absolute live-tree path.
> --
>
> --- Patch [4]: [PATCH RFC 4/4] of: unittest: cover /aliases updates from =
overlay apply/revert ---
> commit 1237920f0bd1d803a084dc2f03f9e63aaf5cd6a2
> Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>
> of: unittest: cover /aliases updates from overlay apply/revert
>
> This commit adds an overlay and a test runner to verify alias creation an=
d
> removal dynamically during device tree overlay apply and revert operation=
s.
> It asserts that the alias is correctly added and then removed.
>
>>     exercises all three functional patches earlier in this series
>>     together: patch 1's reconfig notifier is what mutates aliases_lookup
>>     on apply/revert, patch 2 is what lets target-path=3D"/aliases" resol=
ve
>>     to the DT root when target_base is non-NULL, and patch 3 is what
>>     rewrites the fragment-internal path in the alias value so
>>     of_find_node_by_path() finds the live-tree target. Any one of the
>>     three missing turns the middle assertion (get_id -> 99) into
>>     -ENODEV.
>
> [Severity: Medium]
> Is this description of the test coverage accurate?
>
> As detailed below, the test appears to bypass the logic for both patch 2 =
and
> patch 3. The overlay uses an absolute path instead of an intra-overlay
> reference (bypassing patch 3), and overlay_data_apply() passes NULL for
> target_base (bypassing patch 2).
>
>> diff --git a/drivers/of/unittest-data/overlay_alias.dtso b/drivers/of/un=
ittest-data/overlay_alias.dtso
>> new file mode 100644
>> index 0000000000000..32532c80505a7
>> --- /dev/null
>> +++ b/drivers/of/unittest-data/overlay_alias.dtso
>> @@ -0,0 +1,9 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +/* overlay_alias - declare an alias inside an overlay */
>> +
>> +&{/aliases} {
>> +	testcase-alias99 =3D "/testcase-data/overlay-node/test-bus/test-unitte=
st100";
>
> [Severity: Medium]
> Does this overlay actually test the path rewrite logic from patch 3?
>
> The testcase-alias99 property is defined using an absolute live-tree path
> rather than an intra-overlay fragment reference. Because this is already =
a
> valid absolute path, it seems of_alias_create() will successfully resolve=
 it
> via of_find_node_by_path() even if the rewrite logic from patch 3 is
> missing.
>
>> +};
>> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
>> index e255f54f4d760..a9f4a0bb30872 100644
>> --- a/drivers/of/unittest.c
>> +++ b/drivers/of/unittest.c
> [ ... ]
>> @@ -3475,6 +3475,53 @@ static struct notifier_block of_nb =3D {
>>  	.notifier_call =3D of_notify,
>>  };
>> =20
>> +static void __init of_unittest_overlay_alias(void)
>> +{
>> +	const char *path =3D "/testcase-data/overlay-node/test-bus/test-unitte=
st100";
>> +	struct device_node *np;
>> +	int ovcs_id =3D 0;
>> +	int id, ret;
>> +
>> +	np =3D of_find_node_by_path(path);
>> +	if (!np) {
>> +		unittest(0, "could not find %s for alias test\n", path);
>> +		return;
>> +	}
>> +
>> +	id =3D of_alias_get_id(np, "testcase-alias");
>> +	if (id !=3D -ENODEV) {
>> +		unittest(0,
>> +			 "of_alias_get_id() =3D %d before overlay, expected -ENODEV\n",
>> +			 id);
>> +		goto out;
>> +	}
>> +
>> +	ret =3D overlay_data_apply("overlay_alias", &ovcs_id);
>
> [Severity: Medium]
> Does this test actually exercise the target_base logic from patch 2?
>
> Looking at overlay_data_apply(), it calls of_overlay_fdt_apply() with a
> hardcoded NULL for target_base:
>
> drivers/of/unittest.c:overlay_data_apply() {
>     ...
>     ret =3D of_overlay_fdt_apply(info->dtbo_begin, size, &info->ovcs_id,
>                                NULL);
>     ...
> }
>
> When target_base is NULL, the pre-patch-2 code already resolves
> target-path=3D"/aliases" correctly via of_find_node_by_path(). This means=
 the
> test might pass and bypass patch 2 entirely, missing the intended test
> coverage.
>
>> +	if (!ret) {
>> +		unittest(0, "overlay_alias apply failed\n");
>> +		goto out;
>> +	}
> [ ... ]

Will address in v2.
