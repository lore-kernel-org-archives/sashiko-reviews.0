Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C71A27B35F
	for <sashiko-reviews@lists.linux.dev>; Mon, 25 May 2026 03:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779678672; cv=none; b=q/hHsbeHxd48PNPoR0H4x+ddU7ozbUt+TJRgD3KWanSMUzjzy/g5r3YiDdkdbgEKSBBVHasZzuRIPUdKfEh6USy7En4yo4L6jzCu9cZXLtuUwmXKHULY7eabwdiJyYEuiA1JpKhkRhUKNETRwFQOegkc2C1zwgHGT5LgZ/VBE0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779678672; c=relaxed/simple;
	bh=S7TAaCBfyT6PJkGCZ2CQT3rHLdQWi+Op3g84ncear9M=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=swCp5KzsFSHsvQyfPuQMwcTfnfcgNSG1Nc0B8WM1XpIw/T5oWmjd3zitnjGdOCOu772AwDCNZRkomlWhtDm4D9XC2Th89YXH5hQa4ogCGh+rpixcEJQrcBWfxT5Eb+NXrNd6l8akdYAv+mEOnC6GFP1XiKabFdfOthfUoT7JzB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KxvCv8pW; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KxvCv8pW"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-914c1ced558so97351885a.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 24 May 2026 20:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779678670; x=1780283470; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=L1ewu1BojhJLfgZiR0UNvxEti+UmNvL3WdI7IiOYK30=;
        b=KxvCv8pWZY+/pRgnJOdNen2NdOdpgnMFI0I6HOqLxqRwXRsN+sG5wbMs5e4++Ln1YT
         wPGPNJ+cnH8l7qgwyio4Jj6ZxvKHub1q63iFXgBEF6o2kCNpV2U0IzexHvQ3WEdkb2br
         EUQ6h6cTr700YjzQtIxChw20HRkFEJFbYroPh4F2upg/8brUN3hDYqFCHP18Skhcc0Gb
         gngumTOAq/8n0nHdBIlfDwxvNI4xVylwCf14l10Ftzr/3jj+hfbbuH1sSJL0yUP+hKVo
         6TqD5bBN/H2Zs0LfDRwY5g0SQAwvQPj9MdUqLQNoNp2ud1yjA/cCmdKjqDYAk/K7f/Nt
         wFqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779678670; x=1780283470;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L1ewu1BojhJLfgZiR0UNvxEti+UmNvL3WdI7IiOYK30=;
        b=s++8vaMgMN6RKzo5RGSN4F/hG3nabVr0AGUw9JUP4IqAThsn5G998gXuUdqB9WkU4f
         nvezhpui8mxy1gtFR1M74pTjPhUwYsB0Qb0eOyD+ZfeOXnpqRs2bp3Uyiq9mO3ofM6FP
         uFLT1iLCXjT3pRC6FmZ2n0N+7mXPvtiuAJLiEkE7JVWU1gMAVwBiDAu8qDRNgSw3lwgH
         IGMmjD/mjH2DTDvEfui4KQAl4xJ8g/G/qv1ksyQfyLT4SBh6bZ6AU9TIqJyr/zMEP/Vq
         hNdpFrgVq4q+cKBm++GJ+bAxeBspcCTzTbAk01OOaHxvBZgvTxK5YToFBIX0OQ1N8pSr
         f2KA==
X-Gm-Message-State: AOJu0Yz9lH6C2k6/NKKkMYOULJZVb4C1ULeceZRW3QYXqD6HDvpBNYmI
	jKS+D6x9/cvT3bNNitF0rP/rbZk5/oST5V/XbLwrZuWT9WIvAqvNCiWMh3B3SHn9
X-Gm-Gg: Acq92OH1Ux1JZc1mnZHX3YSB4MOxWkM+BCJzSjiw3bJTDHEC3dX69JcA4aIAiN1YUVn
	QdtHOESdV1tLkYmQ29kuwdRNm06LTppr3zl8fw3wV2fp7I4JoCsg4ZOZf6oFfp4G6F45hHrBEV7
	wXVChHWmq5DD8b++HQJw3VhfS/ZvmLqvP25zNIarBsewxBj2QlZYeqQM0EujsrhFHAiJcYAhrdc
	AtSG3fBEzGkXF45fJ5fl7Sr48PjxsyRMOywA6yhCYakYVDV5yh2kAW6E3H3g5/0rI7UsfM6caBf
	z3E2BNKYI1odZPNJYYWJ+qX/rOnjG37hmh0Q5aGOuPmLiT2kMrcdl190jwrPsHtRIQBkQrB7i8/
	WLNvqVmh+T7Gq+rWocfjJmPK26M3paVa09CHG12DKP7UjHpxK954+kVhys+wvcXgTZTjltn5evD
	jF/WE/wpnqohEr9rbTM6ML0ixS0EyzTfah2Qq+Or1zFuNZRS9GA/KjWADuNnMEfpxfzeiVorlL3
	Ag6N5I5YHkHLN2efS4HGw==
X-Received: by 2002:a05:620a:31a6:b0:914:e3dd:17fd with SMTP id af79cd13be357-914e3dd293dmr218181585a.6.1779678670493;
        Sun, 24 May 2026 20:11:10 -0700 (PDT)
Received: from ehlo.thunderbird.net ([172.59.187.228])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-914c217cf69sm786921985a.24.2026.05.24.20.11.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 May 2026 20:11:10 -0700 (PDT)
Date: Mon, 25 May 2026 12:11:08 +0900
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: sashiko-reviews@lists.linux.dev, sashiko-bot@kernel.org
CC: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, bentiss@kernel.org,
 jikos@kernel.org
Subject: Re: [PATCH v9 1/4] HID: hid-msi: Add MSI Claw configuration driver
User-Agent: Thunderbird for Android
In-Reply-To: <20260525023712.E1C131F000E9@smtp.kernel.org>
References: <20260525020543.519082-2-derekjohn.clark@gmail.com> <20260525023712.E1C131F000E9@smtp.kernel.org>
Message-ID: <96119A63-AD73-44F3-9E24-904093EFB8AF@gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On May 25, 2026 11:37:12 AM GMT+09:00, sashiko-bot@kernel=2Eorg wrote:
>Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>- [Medium] Mixing goto-based error handling with scope-based cleanups (__=
free, guard) in claw_hw_output_report=2E
>--
>
>commit 279964e3a8cf0a3835903d6bad7357f0ca42f523
>Author: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>
>HID: hid-msi: Add MSI Claw configuration driver
>
>This commit adds a configuration HID driver for the MSI Claw series of
>handheld PCs=2E It introduces the initial driver outline and attributes f=
or
>changing gamepad mode, M-key behavior, and resetting the device=2E It als=
o
>adds a completion bypass when the timeout is 0 to handle USB disconnects
>gracefully=2E
>
>> diff --git a/drivers/hid/hid-msi=2Ec b/drivers/hid/hid-msi=2Ec
>> new file mode 100644
>> index 0000000000000=2E=2E3a176f44f2c43
>> --- /dev/null
>> +++ b/drivers/hid/hid-msi=2Ec
>
>[ =2E=2E=2E ]
>
>> +static int claw_hw_output_report(struct hid_device *hdev, u8 index, u8=
 *data,
>> +				 size_t len, unsigned int timeout)
>> +{
>> +	unsigned char *dmabuf __free(kfree) =3D NULL;
>
>[ =2E=2E=2E ]
>
>> +	guard(mutex)(&drvdata->cfg_mutex);
>
>[ =2E=2E=2E ]
>
>> +	ret =3D hid_hw_output_report(hdev, dmabuf, CLAW_PACKET_SIZE);
>> +	if (ret < 0)
>> +		goto err_clear_state;
>
>[Severity: Medium]
Hi robot,

Interesting that this same issue was Severity: Low in v8=2E=2E=2E

>Is it intended to mix scope-based cleanups with goto statements in this
>function? The subsystem guidelines recommend either converting all resour=
ces
>that need a goto cleanup to scope-based cleanups, or converting none of t=
hem=2E
>Mixing __free() and guard() declarations with goto-based error handling i=
n the
>same function can create confusing ownership semantics=2E
>

The goto's don't return early or break in/out of guarded sections=2E It si=
mply skips waiting for the completion if there was an error sending the pay=
load=2E Using this goto removes the need for 8 lines of duplicated code and=
 the use of cmd_lock in 2 additional places=2E Unless Jiri or Benjamin spec=
ifically ask for it I don't intend to change this=2E

- Derek

>> +
>> +	ret =3D ret =3D=3D CLAW_PACKET_SIZE ? 0 : -EIO;
>> +	if (ret)
>> +		goto err_clear_state;
>> +
>> +	if (timeout) {
>> +		ret =3D wait_for_completion_interruptible_timeout(&drvdata->send_cmd=
_complete,
>> +								msecs_to_jiffies(timeout));
>> +
>> +		dev_dbg(&hdev->dev, "Remaining timeout: %u\n", ret);
>> +		ret =3D ret > 0 ? drvdata->cmd_status : ret ?: -EBUSY;
>> +	}
>> +
>> +err_clear_state:
>> +	if (timeout) {
>> +		guard(spinlock_irqsave)(&drvdata->cmd_lock);
>> +		drvdata->waiting_cmd =3D CLAW_COMMAND_TYPE_NONE;
>> +		drvdata->waiting_for_ack =3D false;
>> +	}
>> +
>> +	return ret;
>> +}
>

