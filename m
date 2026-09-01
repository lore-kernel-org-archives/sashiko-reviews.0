Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B247247207D
	for <sashiko-reviews@lists.linux.dev>; Tue,  1 Sep 2026 08:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250145; cv=none; b=Vnr+1R9tiP8sbGC0mFlKHOvC4fp83Ct/FGp1tgFvZ0zvGNpAHHwpXcNRBTUwpuhFJs+KHBqw59C84fS6cnbMp1JukdUsURFhEPSi2aF+FkQSsk5/DckAFeMIM8xYkiqhhPcNY2lI6mJdWW+PRoijE8DXuQfFnXxNpelGgfjWQcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250145; c=relaxed/simple;
	bh=mO+bHFbqo9tsrly6mVmy1ocgyRFE6syW3MWGj2ORxa4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=P5WOa96ZsYsQfuf7FwNNF/6HB3P3Nvmga6L5hPitQDrYwnYDSVfvMzDDVc+W0CMp1Y5iZR1HejtwD4+jMth10346wbNhTH4z/XIIfnYOop4eDhHJYO7pbuLieEMiuV44nd5b9hUlOVgB4d+WdE4t7krcFzNvlszM/B3aS3H0q8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YbPREcnx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YbPREcnx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788250142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4l21st1u8jY9b4j7j3tAgD/EY2/nE/37rmIDNVn7xOs=;
	b=YbPREcnxdop3LDFuzbtuNYZO5MRHiXlEOK3F8+wnfZUI477ZPH+vLFQ/QL0ZJ69kYu7ML3
	Nc4yzKiU6Ep3DrGnlLHGdfqMWROW8bz54S4ZQkAqa3qUYGFMuzhq5FGSPMskKkuyN3BIm4
	yxON18f6cwNTlePNzdCrJADuF6IocrU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-499-A8E7iQu-MmCxDTZH-Ii7VA-1; Tue, 01 Sept 2026 04:09:01 -0400
X-MC-Unique: A8E7iQu-MmCxDTZH-Ii7VA-1
X-Mimecast-MFC-AGG-ID: A8E7iQu-MmCxDTZH-Ii7VA_1788250140
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49991beee7aso41250665e9.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 01 Sep 2026 01:09:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250140; x=1788854940;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XdL8zzc8V9JkK2rUeyT0WO94d4yIRGolbKfwcYc2drU=;
        b=bPfSXDyHqxJkStAzx91DRqVIFr6UxGcuEfjYfcRpTfEPHav35l4JBNJH1/R9q3Q1+v
         Lvy/2bBSmMkBbTmxMiu8UIfNkJruHL/RNMsMSt9CSZgKVzJicJPunvlNBz7WBYCBpK22
         YHDQH88z/9qIRF0rYpMsR2shspN3zcI5xf9ifCTyMKp4KzvyFuOwKhEiF6N/eVWanFsx
         DiPv+I5qsj/mqUSaJiXKpXlRITcSfl2rcB8g0V2NE7FNnYoNtnt8Ur9lre4VobVs8XXS
         fua9rpw1dJ+MBYc5qCldePtalhgPwi729Ix5BwCol+q9XQV+/I246CChjC/SJVMCHgnD
         cDZQ==
X-Gm-Message-State: AFuF++nFmLXxIuhRZoLkaMJFU0VkO1rLOzPlWK0lyYeJN5evaxrCrNPg
	Stl5vqMSSye5QwUQXghWdGlW1c/l6sjx6N6BwDzxYyLwfg4jWzANWHbjaFxEZFeQdTGAj/5cCMC
	T/uezuX2lq2cWQzOwMlUdwlQrq/a4G1tjZTxFDQQ5ZK+C6Kjyi4r4sUPFc6AKXNXGGBgOJftJjo
	XHNN0hHbay4nB8IpB8FPzMWWFL9HvDbA9p4ytktGeosyneklMt
X-Gm-Gg: AR+sD13RnMH9pSt1satafs0d3Ggd4KEkQaoTCr+B8hhH1h3VCpxBBQne50ZRsE3dPZI
	lDXfdpQQ+Ob5v+ZjH/euz3myziyAxKZ6oDMLO+m3Xiz+v7GJGlNnC0dQGqowqfKuhle6Jr9RK1z
	LHtM5RG2qya/OhylMnDBfMd1KjOlczTZasiqoOgqb6JfxOI7x0JBFzATf1HmhDTEV3fwVqHWVVy
	ZG9S2K5PnoYLW4NHtlW5m+HEE1ot5zVJJjrr8tofl1CZ50+yrojBrq9aaNlOOhqYByIyc0cthKX
	2Xk00zx9RP1UthMWLjHA3yUtt95wWqc0iAd85DZEeWhrBNmQk1yewfqRecM27i126wlrmEbFnML
	q+JZn9ZIo90JuLN74+ut9f3qCKRQ=
X-Received: by 2002:a05:600c:a418:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-49cdc558513mr105413905e9.10.1788250140372;
        Tue, 01 Sep 2026 01:09:00 -0700 (PDT)
X-Received: by 2002:a05:600c:a418:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-49cdc558513mr105413065e9.10.1788250139923;
        Tue, 01 Sep 2026 01:08:59 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk (alrua-x1.borgediget.toke.dk. [2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd8148fbdsm74332025e9.3.2026.09.01.01.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:08:58 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id EA00497C4A1; Tue, 01 Sep 2026 10:02:59 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH bpf-next v2 2/4] bpf: selftests: Check for flag presence
 in bpf_program__flags()
In-Reply-To: <20260831134450.680941F000E9@smtp.kernel.org>
References: <20260831132648.65843-1-toke@redhat.com>
 <20260831132648.65843-2-toke@redhat.com>
 <20260831134450.680941F000E9@smtp.kernel.org>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Tue, 01 Sep 2026 10:02:59 +0200
Message-ID: <87y0dlv1os.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nMGcA-eB4RpLSRUkVIS7KxRR6kcLW3oomc0uovYN0Mk_1788250140
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

sashiko-bot@kernel.org writes:

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Missing NULL pointer check on the result of bpf_object__next_p=
rogram() causes a potential test crash.
> --
>
> commit 357b58adee859a9375d4063d6f64aa4a923e7790
> Author: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>
>
> bpf: selftests: Check for flag presence in bpf_program__flags()
>
> This commit adds checks to verify that the BPF_F_XDP_HAS_FRAGS and
> BPF_F_SLEEPABLE flags are correctly exposed by bpf_program__flags(). It
> introduces assertions in multiple selftests immediately after retrieving
> the BPF program structures.
>
>> diff --git a/tools/testing/selftests/bpf/prog_tests/xdp_adjust_frags.c b=
/tools/testing/selftests/bpf/prog_tests/xdp_adjust_frags.c
>> index fce203640f8cf..a894b1ab46f4e 100644
>> --- a/tools/testing/selftests/bpf/prog_tests/xdp_adjust_frags.c
>> +++ b/tools/testing/selftests/bpf/prog_tests/xdp_adjust_frags.c
>> @@ -18,6 +18,9 @@ static void test_xdp_update_frags(void)
>>  =09=09return;
>> =20
>>  =09prog =3D bpf_object__next_program(obj, NULL);
>> +=09ASSERT_EQ(bpf_program__flags(prog) & BPF_F_XDP_HAS_FRAGS,
>> +=09=09  BPF_F_XDP_HAS_FRAGS, "frags in program flags");
>> +
>
> [Severity: Medium]
> What happens if bpf_object__next_program() returns a NULL pointer here?
>
> The prog pointer is passed directly to bpf_program__flags(), which
> unconditionally dereferences it. While the object file is expected to con=
tain
> programs during normal builds, if it does not, could this cause the test =
suite
> to hard crash with a segmentation fault instead of failing gracefully?
>
> Prior to this patch, a NULL prog would be handled more safely, as the lat=
er
> call to bpf_program__fd() explicitly checks for NULL and returns an error
> code.=20
>
> Does it make sense to add a check like ASSERT_OK_PTR(prog, "prog") before
> accessing its flags?

No. This won't happen, and existing code already use the pointer without
checking it.

-Toke

