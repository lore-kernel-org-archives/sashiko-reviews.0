Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A552DC76A
	for <sashiko-reviews@lists.linux.dev>; Wed, 19 Aug 2026 12:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144295; cv=none; b=Hljr9Y5rihIG9qRqXY/JRTIXNbCPxCFdg8cJf3pzySm40MZ4ICBZafcw5fKlZJ3MIZ9ZjaaTHhxsyiWzvXv/1gw7TnrjnwB3pnRMR1LvQ5QfkDM+Wk1WQvUOBsodvwZvraCDWwnuwSb6YZuewlkH/f2GGNkg4Ef3MNvnydsy7ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144295; c=relaxed/simple;
	bh=d7aswmRc0xnzNBIXchR00wnLcVM6HK9HLZ4NdUignjc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=IjMqUo2MrBZvQJvO5vfMRAR8Yi6r202EEPF3euyzOokR44u/feS1MfPCTzfz4cG65b9l2pxnHjBy+sCx3SAHuI2HykRuzGHACPVKaXoCI0pUpqf5IGwIbEAINbZ5fImWtgSp7b/OVZx3Kmb5w/YNnbdI488BkwbuASda3Ny8Bfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HO81+Ho4; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HO81+Ho4"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 177A51A1741;
	Wed, 19 Aug 2026 12:58:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D90695FF42;
	Wed, 19 Aug 2026 12:58:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8220D11C7107F;
	Wed, 19 Aug 2026 14:58:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787144291; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WW43aCP5FG1KxTJ7NUvEkhvGk1ZgGIn4oiSyR3yu9f4=;
	b=HO81+Ho41SXaFNQhQT/exFjLjxiRrCCFTsfnek9XDklp01ad94V6fjcvehHVsPQ8Vkq24M
	S5yWbh/D8yZdJEglh/e9Tq6gJJunrpCrwbNjVSaxFDlEjAP2L+lzRZH0aZXsmmq9xyCmtL
	3/HCJUcntEahTsqgVoddttz7pCDDX5syGa9GC74B3Brb4Jpd3K6+eGNXXk8srchg2ewROn
	jhOEAl85Hrv+VdY3lPztMZj8oM71Lq/4zUtT+Ash9FRj8XJb+RAVXfok3y/UicIZ+0u79A
	QMumJaZTZpYR81rWXLgz3G/s9Ke67jcOgAsk/XH9O/CqY8P6nX21tM1EpuHc0w==
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Aug 2026 14:58:02 +0200
Message-Id: <DKSXRX52W03E.2II5M5DIT6E1C@bootlin.com>
Cc: <robh@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
To: "Damon Ding" <damon.ding@rock-chips.com>,
 <sashiko-reviews@lists.linux.dev>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v7 5/5] drm/bridge: analogix_dp: Add support for
 optional data-lanes mapping
X-Mailer: aerc 0.22.0
References: <20260819075238.3007087-1-damon.ding@rock-chips.com>
 <20260819075238.3007087-6-damon.ding@rock-chips.com>
 <20260819080422.816771F000E9@smtp.kernel.org>
 <f0151ee4-f660-43d2-a49d-13ab2ad12dbc@rock-chips.com>
In-Reply-To: <f0151ee4-f660-43d2-a49d-13ab2ad12dbc@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello,

On Wed Aug 19, 2026 at 10:53 AM CEST, Damon Ding wrote:
> On 8/19/2026 4:04 PM, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 2 potential iss=
ue(s) to consider:
>> - [High] Logic error in hardware lane mapping configuration causes inver=
ted assignments for non-symmetric maps.
>> - [Low] Device Tree endpoint lookup inconsistency when querying lane cou=
nts versus reading properties.
>> --
>>
>> --- Patch [5]: [PATCH v7 5/5] drm/bridge: analogix_dp: Add support for o=
ptional data-lanes mapping ---
>> commit 1c15eb6132eedc3d606168644e5f97918c8e3651
>> Author: Damon Ding <damon.ding@rock-chips.com>
>>
>> drm/bridge: analogix_dp: Add support for optional data-lanes mapping
>>
>> Parse the optional 'data-lanes' device tree property to support
>> custom physical lane mapping configuration. If no valid configuration
>> is found, fall back to the default lane map automatically.
>>
>>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drive=
rs/gpu/drm/bridge/analogix/analogix_dp_core.c
>>> index 039e076d2b8ab..cb06347196cef 100644
>>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> [ ... ]
>>> @@ -1240,6 +1240,59 @@ static const struct drm_bridge_funcs analogix_dp=
_bridge_funcs =3D {
>>>   	.detect =3D analogix_dp_bridge_detect,
>>>   };
>>>
>>> +static int analogix_dp_dt_parse_lanes_map(struct analogix_dp_device *d=
p)
>>> +{
>> [ ... ]
>>> +	num_lanes =3D drm_of_get_data_lanes_count_ep(dp->dev->of_node, 1, 0, =
1,
>>> +						   video_info->max_lane_count);
>>> +	if (num_lanes < 0)
>>> +		return -EINVAL;
>>> +
>>> +	endpoint =3D of_graph_get_endpoint_by_regs(dp->dev->of_node, 1, -1);
>>
>
> Hi Luca,
>
> Thanks for taking a look at previous v6 patch series. This Sashiko
> warning was also present in v6. Sorry for CC'ing you out=E2=80=91of=E2=80=
=91the=E2=80=91blue
> without prior heads=E2=80=91up.
>
>> [Severity: Low]
>> Does passing -1 here potentially retrieve a different endpoint from the =
one
>> validated with reg=3D0 above?
>>
>> If multiple endpoints exist on the DP port and the target endpoint is no=
t
>> positionally first, could this mismatch result in reading the data-lanes
>> property from the wrong endpoint?
>>
>
> For Analogix DP, port@1 will only ever have a single endpoint.
> Multi=E2=80=91output configurations are not supported by the hardware, so
> passing -1 cannot select a mismatched endpoint. There is no risk of
> retrieving the 'data=E2=80=91lanes' property from an unintended endpoint.

I understand (1, 0) and (1, -1) will always return the same node in the
real cases, but why doing it? Use the same indices both times and avoid
future readers scratch their head thinking why it's different and whether
they might report a different node in a future case. Also, if parsing a
broken device tree, you may point at two different nodes here. Keep things
simple, readable and reliable.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
