Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE8A4192E5
	for <sashiko-reviews@lists.linux.dev>; Fri,  5 Jun 2026 15:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780672572; cv=none; b=pss66irTSyN2G7+m509Ilonjro8Y+XTgFuU5ZfECjL8zNGL0lcEa7GkL1g5dZSDXectHulizfksZsO8szSgBx7763RuThlB9d2GUo1cdHjRfVyO9SXobgVWINgz/acxPdnpJ12SvRq6Rv1iTgGIQC+7tium6MUwUG1NfCzJCYBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780672572; c=relaxed/simple;
	bh=aShNvsl9/UV6Crwi+FiPnYS1KsTUHaoROsqg2c9hrKo=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=sM7wXrcsQHwgHJ9QUcdemLdNM8AarGP3AXebP7PawEAPHai/ZLYcZcUpPehjq9ywD7iyUsUz0mOxJMIQqDzGLlF4dQUFs0g/JEigHgVq5U7loTHp/CV5cVeVCUHCl3a39+KvE7hMsVLMGdMFVDSIvnkfpRlKiGdaFcU7gqs/IWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=izQfjSFf; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="izQfjSFf"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-36ba285e98bso1976348a91.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 05 Jun 2026 08:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1780672569; x=1781277369; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RIWsKvi/6lQbiJxe71BS27OCJvhTSW9AzUP/bpE81+Y=;
        b=izQfjSFfhqOYk5DCP6Drau77YzA5337/35qm3MnSUPMVpmhPnKJVlM8lwT98bCRRWo
         dlh3YF6r3B3G8mvE+n+06oEpD4cfIGygGOsA16kOG4jRlC0TFPnxmqs+g4bhjMQr9S8I
         rVXK0W1aKjrk2Q+BDuaue+99fZYehikSYcAzE/3Gv6er7ac0J0Pp2cb8oUh8wVp4oBDg
         rWFEeXLhmfLDw+EFgpn70YrPugLRoXOQZo66LhB9wth9XeH6XfVlSce4WlKSPeUVNVAo
         Xh9cM9SXunY2UKOZZ0qqKNzguuzTPzUtDzPxb550fu7sLyVvU9qsLfzAuT1nSwdy5as2
         V5uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780672569; x=1781277369;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RIWsKvi/6lQbiJxe71BS27OCJvhTSW9AzUP/bpE81+Y=;
        b=iFNed2wusRHrnynklWHzYZPObhDWZfUGllVPtq9cDSv2g1I3Kps1+0g8lhKQW3yGB2
         I7BehQ2D6dw01m/DPKUEXlfC4aspI3Z9Ow2lAPl5I0eTRsbpf+dqIZYiNBAYnWIzUlYp
         9kFAGzvyi8YYs0TUXowIcUn8DnbMzpQBaGiNFxhPWJpchqTpvmVuHKMh/DmJYQHBIWH9
         wp89Hcf5Zfz8/ys/LnV1zuVPXjd9KAdkO7cIAZ+IqDG2NYWbHIJd6U7i2UovdbkrKtrC
         /lItEhB6gaHfHDgBqmS6akvox/zgAVgumsAABcXAjDYtcTjXbML3Zou4fchrdczUOGlX
         8U8Q==
X-Forwarded-Encrypted: i=1; AFNElJ9X/Q/+j7RTSywFTAW7bh4Rf6Z1fsP9MRx9Y2p7Qalwh+YoiIJmFhRawNRsndyk6IZZedVcL61QjkrlPndXj3w=@lists.linux.dev
X-Gm-Message-State: AOJu0YxC+ZMFe20k6BEXG7IoCkJoBaR6sGRLpWM8eqNZIGOx2acb+SjO
	N55M5Zw4+tf9HTCRXl8EYmM4LKfxAP2xNQF05NKW8WGiH3yqglwyNeRoyoR7izsrv6A=
X-Gm-Gg: Acq92OFpDZUGJ6EpyaMuKnUsLDl3ddjK8a1Ys/RUPXBu9slQlvaHcJH8oPefRwgI4F+
	InzNmxHBTA3faZqGVgyw3/J4c1rLe5YCnHfPODbTioBxKE+Sx8b6oRxI48XiwSu5sxDJBEdwCsO
	ubAokLofRaVQair7irzwBu5mW9z1almhfV7URUYYWd0wgnuXXYOPyeFIkXVi7HqZ0tb5F0FXI6t
	239Ht1aqBoHpKx/yj2/JgCgMa5zOocxTAUKXHvl209qCECoDJULHliMeIMg/fYjESv52NZylMzb
	7RvL3kSo7q4o4FHI1nN3O7Pl2tYp/vvqpB758elbgWHCXkVhEeWvqeX2cuE82LS1m9sDWk1ku1h
	GwLU8a4HmoM0KfrZZEgexmqK7ieKPmw2FCYnrq6SIgvvRa2fIH7BLdXNjr8vDsNsjUcvk40d+B8
	fvGHczWSAyo+pcz3lTA42QUd0A8YvONpJETTTQUbHK7QSoGpLoQJ0i+ZWupaHrGVs=
X-Received: by 2002:a17:90b:3dd0:b0:36b:8873:d96d with SMTP id 98e67ed59e1d1-370ef3e4eb0mr4796160a91.11.1780672568701;
        Fri, 05 Jun 2026 08:16:08 -0700 (PDT)
Received: from smtpclient.apple ([139.177.225.251])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6dba82c6sm6695319a91.13.2026.06.05.08.16.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Jun 2026 08:16:08 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [External] [PATCH v3 08/15] riscv: Add Zic64b to cpufeature and
 hwprobe
From: Qingwei Hu <qingwei.hu@bytedance.com>
In-Reply-To: <a2o7tkslomyf43dcs4tultdmrzcjgvkjh736l7lqemasljhs2j@tyixe5krxw6z>
Date: Fri, 5 Jun 2026 23:15:37 +0800
Cc: Conor Dooley <conor@kernel.org>,
 sashiko-reviews@lists.linux.dev,
 kvm@vger.kernel.org,
 devicetree@vger.kernel.org,
 robh@kernel.org,
 conor+dt@kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <72942B6A-0B50-49E4-B1F4-E69D1A09288B@bytedance.com>
References: <20260603-rva23u64-hwprobe-v2-v3-8-5529a7b28384@gmail.com>
 <20260602232800.768311F00893@smtp.kernel.org>
 <CA+Ck9FbKRM0wjJMg1fQpdwmow8cf_zTfir7V6+T=CRxU+vomdg@mail.gmail.com>
 <20260604-rice-protegee-3a0b8e4cb609@spud>
 <u52q565xhv5s7gz3wbh4heplhbm4pv732s5kqvf4deiw6ceb4t@n4bnpzu5kabs>
 <6940420B-C9C3-4D60-AB7F-7FBC4B93D855@bytedance.com>
 <a2o7tkslomyf43dcs4tultdmrzcjgvkjh736l7lqemasljhs2j@tyixe5krxw6z>
To: Guodong Xu <docular.xu@gmail.com>
X-Mailer: Apple Mail (2.3864.300.41.1.7)

Hi Guodong,

> On Jun 5, 2026, at 19:32, Guodong Xu <docular.xu@gmail.com> wrote:
>=20
> Hi, Qingwei
>=20
> On 2026-06-05 00:43, Qingwei Hu wrote:
>>=20
>>=20
>>> Ok, I get your point. Agree, Zic64b/Zicbom/cbop/cboz can be =
implemented
>>> on each hart independently (at least spec doesn't say no). With this =
in
>>> mind, the validation of Zic64b should be like this:
>>>=20
>>>   if ((riscv_cbom_block_size && riscv_cbom_block_size !=3D 64) ||
>>>      (riscv_cbop_block_size && riscv_cbop_block_size !=3D 64) ||
>>>      (riscv_cboz_block_size && riscv_cboz_block_size !=3D 64))
>>>   return -EINVAL;
>>>=20
>>> This will allow :
>>> 1. A Zic64b hart with 0, 1, 2, or 3 CBO extension and block_size 64
>>>  passes the validation.
>>> 2. A Zic64b hart with CBO extensions but block_size is not 64
>>>  fails the validation
>>>=20
>>> Thanks for the catch.
>>>=20
>>> I will fix that in v4.
>>>=20
>>> BR,
>>> Guodong
>>=20
>> Hi Guodong,
>>=20
>> Thanks for working on this.
>>=20
>> This overlaps with my earlier Zic64b cpufeature patch[1].
>=20
> Thanks, and you're right that your patch predates mine. Your =
validation
> was also correct (at least resonate with what I planned to do in v4)
> from the start.
>=20
>>=20
>> and Greg confirmed that Zic64b does not imply support for any CMO
>> extensions[2]. It only has meaning for whichever CMO extensions are
>=20
> I'll add a link to quote this in v4. Great info. Thanks for checking
> with them.
>=20
>> implemented.
>>=20
>> Since the Zic64b cpufeature support in this patch overlaps with my
>> earlier patch, if you keep this work in your series and base it on =
that
>=20
> Yes, I'd like to, and I prefer, take the your patch into this series, =
and
> credit you properly. In this series, I also added dt-binding, =
documentation
> and howprobe, and make it consumed by rva23u64 detection.
>=20
>> patch, could you please put my sign-off credit for the Zic64b =
cpufeature part?
>>=20
>> For example:
>>=20
>> Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
>=20
> Yes, since your work came first, I'm happy for you to be the author of =
the
> cpufeature patch, with me as Co-developed-by:
>=20
>    From: Qingwei Hu <qingwei.hu@bytedance.com>
>    ...
>    ...
>    Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
>    Co-developed-by: Guodong Xu <docular.xu@gmail.com>
>    Signed-off-by: Guodong Xu <docular.xu@gmail.com>
>=20
> Let me know whether this works for you.
>=20
> Thank you for pointing me to your existing patch.
>=20
> BR,
> Guodong

I agree with this arrangement.

Thanks,
Qingwei Hu

>=20
>>=20
>> [1] Link: =
https://lore.kernel.org/all/20260528141630.2741710-1-qingwei.hu@bytedance.=
com/
>> [2] Link: =
https://lists.riscv.org/g/tech-unprivileged/topic/question_about_zic64b_an=
d/119631059
>>=20
>> Best regards,
>> Qingwei Hu

