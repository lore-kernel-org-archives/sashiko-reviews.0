Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEC73B95E3
	for <sashiko-reviews@lists.linux.dev>; Thu,  4 Jun 2026 16:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780591458; cv=none; b=PfBQlENhOy/ydj1W1aqS4ui7zFjfVM1VOsWjXehvOmSh+1wCvof1YJHDdZfXpV2GE7PqNjqXu5iVaCHyIsQ3dSIebFL+ZZNA2kMuSPbWiE1Pt7dxTKckhs4pzMD51smnJR+Xkm7KLjK2fxc1QBSW06Cf72M2UfZPayts428b9zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780591458; c=relaxed/simple;
	bh=Aw78agkf6iR3IZDh6wVERI1aeGWmj4gzG03chuIaRK8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Zb1UyHogLXdY+uu1ne8VQRj9UFiD4o0dkN1I1pi5xA+zLg5lBTZDX7TixCQsthpq/mQlDc2wYInne9U/XdZ0BpB8OxwQ1/zEI0so3UMPGCYbN9rs7bBDzlco+RuUnfCONVdCtorAgSDYDvIZglsTlAy/SS1ccNmMxV9Cw1c5Rys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Ya56HYtF; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Ya56HYtF"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c8584e80d59so419567a12.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 04 Jun 2026 09:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1780591457; x=1781196257; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FiXqIV/0AvKBIe6e5IQfr/FZZ4j1GotnIRcH2PcdqiA=;
        b=Ya56HYtFPeBq41xYw2fqkjoai63L6T3rQqn5cMg36sucp2QTTRhKVIcI35b+v5cpZW
         FYsT7OXtzovOOfuwpnGBtL3bpRADe2cQhEzqM3ffPlWBjm+aApihywSQFytzvR00wU2l
         qg7zMAm4zkh5KLOJQGpeJeCB53vcyfiWSkCN7OM7vXpqp6/R4GrsnK9uaZX6B47/pSb5
         pIkA7Sxl9NdhKFjFHWIImg2e9AwWXT2SHtOACUmfhwjPN2HxPyZmD0fSWunQLMteClaV
         we6lXrTCbUsAo6m1ETdk2nc8OUNkNXSuU4YqXUyTOAq8RIuHZxUsnl5rpa5J34Sc7QCI
         LKTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780591457; x=1781196257;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FiXqIV/0AvKBIe6e5IQfr/FZZ4j1GotnIRcH2PcdqiA=;
        b=SLMpFXMeP4RdE/YIS0SOPWfjRhn1QyWllZt4i4Ql07oHARwYp29oxC4TgimC9uRoul
         XgNP3zdkewS2NXKUhjrOjtxYkquKh8GF24zKkdZwYMCVWFE5D8cQqT4aVHFBcWK1uxNF
         7mTbUTxzXbvJUrb3kM33XvxvtKT60txldowudUWVmAbEjH6eFeZNGpaUxhCtkF0W5Ge1
         eaOEmAPH3fEMG9BSa4Tz1lIfdnzyuyPs36R7ciB+QkJ02qtxZVJZJe+FGyt+xCUVYf3q
         f8Nv/hS0ycR9qh3eiaEYO2CWe5dMsSmcAULyrpDFVjQCKAaWNLl+5FOodNhpfEm+1hM2
         Kbsw==
X-Forwarded-Encrypted: i=1; AFNElJ/X0Z9/s7e+ygptmINLhQqGs8tNBAAF48fblREGhev1Kz1cqPLj3ZNaKAJMw4bV4V+je7Z1BOHDEvtaIoUmJ3I=@lists.linux.dev
X-Gm-Message-State: AOJu0YxieRE2h1gzcRFLU5gySmui/Bou/I1+9DkNQWb22ZZQ8ryFKiB2
	zoNN7VbluytQ9c+Kbf/sZfWYP+/CSs6A16/N7OZ0Qh8R09W9/G5LmxRxE4S7TInhMDM=
X-Gm-Gg: Acq92OEVuZf6mhpSlPlVU2cWLIb0AIefuoWgYwmNSokf0Pc5LpltZCAtrI6G0FLtzHQ
	4lhZrrDg9uhmU4M6+L73RwUz8nxHAJzlYDnRa5m7FnuGvoCbqja6KNPQk0WETO9Uq7m/cbujP7W
	yaz6X4R1MvXX8AOMfEDIj2iw82eBRTdq+zkCsIvKUjbQUBuqs2UOucJX+ISUczmt37P5+Yyy/1t
	wJlWEdjiclJQLvRlpxSDBDO1F424bumfQ+2pu0V3MRY8F+N6/MANgNs1uR8wqLFqHUO6cvuJjcn
	DaWWaocutWLI1CnZcCedx9f6LFdx5iSQsUavXPAW+qunGbO7Yf5GJ6keiVwcOB/vYDtpnsnB7Qw
	4At8tAf1EV8NLU8k1czrF9+2lG4LG8loIUBWNnk6JDx1TR7nDZUtpCA3O4VKhkoZCQ2ctXOWjJw
	lL9zV/KFulCYoNo7Lp3vWgtJB30NBK0KEQNVD/FChnUQ+8SsSMu7RZWE6dy6Y7IvGeRa97acJfM
	A==
X-Received: by 2002:a05:6a21:7314:b0:3b4:8566:1ca4 with SMTP id adf61e73a8af0-3b4973296bemr10047203637.7.1780591456849;
        Thu, 04 Jun 2026 09:44:16 -0700 (PDT)
Received: from smtpclient.apple ([139.177.225.235])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df04a0e9sm4835814a12.13.2026.06.04.09.44.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Jun 2026 09:44:16 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH v3 08/15] riscv: Add Zic64b to cpufeature and hwprobe
From: Qingwei Hu <qingwei.hu@bytedance.com>
In-Reply-To: <u52q565xhv5s7gz3wbh4heplhbm4pv732s5kqvf4deiw6ceb4t@n4bnpzu5kabs>
Date: Fri, 5 Jun 2026 00:43:22 +0800
Cc: Conor Dooley <conor@kernel.org>,
 sashiko-reviews@lists.linux.dev,
 kvm@vger.kernel.org,
 devicetree@vger.kernel.org,
 robh@kernel.org,
 conor+dt@kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <6940420B-C9C3-4D60-AB7F-7FBC4B93D855@bytedance.com>
References: <20260603-rva23u64-hwprobe-v2-v3-8-5529a7b28384@gmail.com>
 <20260602232800.768311F00893@smtp.kernel.org>
 <CA+Ck9FbKRM0wjJMg1fQpdwmow8cf_zTfir7V6+T=CRxU+vomdg@mail.gmail.com>
 <20260604-rice-protegee-3a0b8e4cb609@spud>
 <u52q565xhv5s7gz3wbh4heplhbm4pv732s5kqvf4deiw6ceb4t@n4bnpzu5kabs>
To: Guodong Xu <docular.xu@gmail.com>
X-Mailer: Apple Mail (2.3864.300.41.1.7)



> On Jun 5, 2026, at 09:31, Guodong Xu <docular.xu@gmail.com> wrote:
>=20
> On 2026-06-04 10:17, Conor Dooley wrote:
>> On Thu, Jun 04, 2026 at 02:42:22PM +0800, Guodong Xu wrote:
>>> On Wed, Jun 3, 2026 at 7:28=E2=80=AFAM <sashiko-bot@kernel.org> =
wrote:
>>> >
>>> > > @@ -154,6 +154,23 @@ static int riscv_ext_zicbop_validate(const =
struct riscv_isa_ext_data *data,
>>> > >       return 0;
>>> > >  }
>>> > >
>>> > > +static int riscv_ext_zic64b_validate(const struct =
riscv_isa_ext_data *data,
>>> > > +                                  const unsigned long =
*isa_bitmap)
>>> > > +{
>>> > > +     /*
>>> > > +      * Zic64b mandates 64-byte naturally aligned cache blocks; =
cross-check the
>>> > > +      * cbom/cbop/cboz block-size device-tree properties to =
avoid inconsistency.
>>> > > +      */
>>> > > +     if (riscv_cbom_block_size !=3D 64 ||
>>> > > +         riscv_cbop_block_size !=3D 64 ||
>>> > > +         riscv_cboz_block_size !=3D 64) {
>>> >
>>> > [Severity: Medium]
>>> > Will this check erroneously disable Zic64b if a platform does not =
implement
>>> > all three CBO extensions?
>>>=20
>>> Zic64b is mandatory in RVA22/RVA23, which also mandate Zicbom,
>>> Zicbop and Zicboz, so all three block sizes must be present on any =
Zic64b
>>> platform.
>>=20
>> Where do you get that conclusion from? That's not how we treat any =
other
>> extension defined in the profiles spec. My understanding was that =
even
>> if things are defined in the profiles spec that they're fair game for
>> independent use.
>=20
> Ok, I get your point. Agree, Zic64b/Zicbom/cbop/cboz can be =
implemented
> on each hart independently (at least spec doesn't say no). With this =
in
> mind, the validation of Zic64b should be like this:
>=20
>    if ((riscv_cbom_block_size && riscv_cbom_block_size !=3D 64) ||
>       (riscv_cbop_block_size && riscv_cbop_block_size !=3D 64) ||
>       (riscv_cboz_block_size && riscv_cboz_block_size !=3D 64))
>    return -EINVAL;
>=20
> This will allow :
> 1. A Zic64b hart with 0, 1, 2, or 3 CBO extension and block_size 64
>   passes the validation.
> 2. A Zic64b hart with CBO extensions but block_size is not 64
>   fails the validation
>=20
> Thanks for the catch.
>=20
> I will fix that in v4.
>=20
> BR,
> Guodong

Hi Guodong,

Thanks for working on this.

This overlaps with my earlier Zic64b cpufeature patch[1].

One detail about the validation: I also don't think Zic64b should =
require all
cbom/cbop/cboz block sizes to be present and 64 bytes. I asked about
the intended Zic64b/Zicbo* relationship on the RISC-V unprivileged list,
and Greg confirmed that Zic64b does not imply support for any CMO
extensions[2]. It only has meaning for whichever CMO extensions are
implemented.

So I think the validation should only check the CBO block sizes for CMO
extensions that are actually present, rather than requiring all of
cbom/cbop/cboz to be 64 bytes.

Since the Zic64b cpufeature support in this patch overlaps with my
earlier patch, if you keep this work in your series and base it on that
patch, could you please put my sign-off credit for the Zic64b cpufeature =
part?

For example:

Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>

[1] Link: =
https://lore.kernel.org/all/20260528141630.2741710-1-qingwei.hu@bytedance.=
com/
[2] Link: =
https://lists.riscv.org/g/tech-unprivileged/topic/question_about_zic64b_an=
d/119631059

Best regards,
Qingwei Hu

>=20
>>=20
>>>=20
>>> And architecturally, all the block sizes are one quantity: under =
Zic64b
>>> that value is 64, so the three must all read 64.
>>>=20
>>> Anything else is a misconfigured DT, and the kernel should not trust
>>> the zic64b it claims.
>>>=20
>>> BR,
>>> Guodong
>>>=20
>>> >
>>> > If a hardware platform implements Zic64b but omits an optional =
extension
>>> > like Zicbop, the riscv,cbop-block-size property might be absent =
from the
>>> > device tree, leaving riscv_cbop_block_size initialized at 0.
>>> >
>>> > This unconditional check evaluates 0 !=3D 64 as true, which would =
spuriously
>>> > trigger this error path and disable the valid Zic64b extension.
>>> >
>>> > Should this validation only enforce the 64-byte size if the =
corresponding
>>> > block size variable is non-zero, indicating the extension is =
actually present?
>>> >
>>> > > +             pr_err("Zic64b detected in ISA string, disabling =
as the cache block size is not 64 bytes\n");
>>> > > +             return -EINVAL;
>>> > > +     }
>>> > > +
>>> > > +     return 0;
>>> > > +}
>>> >
>>> > --
>>> > Sashiko AI review =C2=B7 =
https://sashiko.dev/#/patchset/20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28=
384@gmail.com?part=3D8
>=20
>=20
>=20

