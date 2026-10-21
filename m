Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792541196;
	b=D19WatziIvxBpiez6mJ8/cp8lQ0A7H0hRMaUL5BqtxsoXzCAMQI9woGhhP9h9XzSmKNr
	 xxkEikk2TVklFl3zzDzo/6jecHojTrb9Xvh/V4SEZgJH2oIfDXqnwN/PBfqOlfKGPMox8
	 Bmixn/HWygf520R3FfZncm8AQWrA4K70q6O27DEMPfWnr44sFa4WYWeQw+iru3E0m2tZT
	 KXI4kccp860Sbz930ofYLo6jrvUTExSDie+tDrsOCOFhZMBNW+kFnL/X1BGRlumMOr0Nu
	 JVqP2jAc75iy/t2sKujy7Ck6A+3eETJDBNjbBkrUqrOIdK9+/U4CkDOnMVfnhXVLFUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792541196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:From:To:Cc:
	 Subject:X-Mailer:References:In-Reply-To;
	bh=E1iiJ2Iaf9vCRbFh4+GEtLtF5DOBjcM+TmDaqT8MSR0=;
	b=zU0ieHgYPTRetZtb8cuNFvENboa3hMbTxjMZkg1ftQkdoy0kh/4Ma6zB/6mfr4q9VYKF
	 yFGorqE9gQjsTihaQBvu8jmRC/cFmz94seMwntyChgJFDJptOrlMSIF1hUECmTZZEZKpR
	 OvQ+W0DmBKuGe/zIxwwuRSdcDbWFSMnnLowMpqk8Y/+C+Be+PBW3FFJ6SJ4oHtx9045Hi
	 KoMik4WmJZ70tbbo4+sZCndSZKFVEGJ2MCkBNBnn+nH2cAbA6OtWAnRXFOtbdtdSl1Za3
	 4Ci2C8OTvfO67QCMyq7JUh9krDu+NVjiIskZSFUhnsHm59kGegHHcAI2Y6mfo9bBEag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TvxoNvTr;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E52606A31A
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 00:06:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93E52606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TvxoNvTr
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ac5b090d16so90831a91.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 17:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792541196; x=1793145996; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E1iiJ2Iaf9vCRbFh4+GEtLtF5DOBjcM+TmDaqT8MSR0=;
        b=TvxoNvTrt/iF1Uri3bFayiA0wYuviRmGiUqvERf/cpEzmQp9sXRqfat2gDkBRCbtgg
         88lR+hpYvcQnI3rQqcGt/gReMnNJH+bHv/Z57sDQG9+ARRysy7w31qQMYVdSzg5JfR1J
         5vgRSWUH50vw3UutgToZLICYrmDC4ati8uQLuvNkV8Wc0u+bDaD1PJNORcNy08h/qJug
         qwIB0Hv74JGd6EzEyl7o590tz7r1fS+S3MknmTOv2gYbOBsRd0NiVOtbsOjEBdBqfd2c
         mguNnC1kgeXMteUxnhBMgdUxjFC7EK1JL4OIV925ahJu8OF8SW8JKLx3Fg744fpq2HCK
         wP+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792541196; x=1793145996;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E1iiJ2Iaf9vCRbFh4+GEtLtF5DOBjcM+TmDaqT8MSR0=;
        b=BDiONavVtoMD/CqpivAENlTQtn6n/Enp7uMrV04WnlZ4+wAfrqYkeAKDbC83kcxN0A
         vzmqlHZ7Z/nLrN78xqHqWRlaNsnSC/3f9utQ4vtx7y6s3RBQ9ERbtgJvQKTC7bzuNuRw
         DXE10g7a9xlJk43XFbREcl9hASXPuiLaMyhnbDJgknzZEDU6X+M9Xjqluu0g1DW0EFWF
         TwXdh69dhFNGFD+IOCuczNfEkNuh/UpuIyrHr12+6gF97WDspE/WL5/rsMTESLfk86vg
         /3Cv50n1rvOIpLZoKOXgPfZ+EJBgT/Y06pRixD+sLMV5obLlidwF7JNgA9hjLQBg5zYF
         uuXw==
X-Gm-Message-State: AFq9FYKg+zRpCYpovtH+NT33TVFgT935GOHdXL/MUMgREt3zFdqUYAdw
	pkQ3Oqvo1M+bMW8A0n56U8M1nIGqq4AXrmgHgrdmmH8A33nmhwjHdaBY642MYg==
X-Gm-Gg: AYBFou3txxUUbjD0EDSGdjmvD0rP942lJuZbb2ts1K2VkhDpL8AWQQPuoglhdeZP0Et
	UIQ524Utmb3eYpuE17Up7HOYy2YE9jVTRyMIPPVt0PBrdte9mvbjul1GD2pFVXgEdqDNlUuE5zt
	vFZ/Yei3nhD8tX7+0FuVpaTT8odWB+JmkcU/mAbqTfqJ4DoVUagC14Lzs46TcLaItdw+Q9o1jZK
	5JIhDh53rMY5VBtzYJ0/5dWIXbaZ8yLBPXWNzIvNzt8JCajW1ei1PGl8ksQf/adMLtYyIdF/Os7
	hdrgSZz8YHW+cFoPQ5eqxHfqXvhzJe6Ug2URn9RI7GcV+dmeV6ZCRpARAIl5OQ6ZtX5hxSdWvBz
	9Gu9eXb/o7NPm2g1cTqmjW6JOad9Rou4saA0eKDy3BkoaxG2WttQa6R6ttqyfiuVyguvlaKKPoi
	yYN6dig+Ym1QgFpAC0v+mjtBcfL4OHKXE5YGK9i3YGHNd/Srr9vANPuIZoVSs0YzIWBt0Wv4kKq
	OaolPO7eJWrchE+Y3pKKGRaFAoiWzJjeFCh30Xrm1EhRkXAssg+BNZZPMdraMsJ9ItEjLvhZiRK
	cSNNuKEyk5fz0AAmjY+E9No4x4BxRcm/JkkJ8VB00F7LMLVtu1OIgghlH7ls
X-Received: by 2002:a17:90b:55cd:b0:3a0:eec6:b065 with SMTP id 98e67ed59e1d1-3ad86e96c31mr264931a91.13.1792541195774;
        Tue, 20 Oct 2026 17:06:35 -0700 (PDT)
Received: from localhost ([153.61.198.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad80303302sm1506747a91.11.2026.10.20.17.06.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 17:06:35 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 00:06:34 +0000
Message-Id: <DMA2TKIVB6J4.2UF472OAJGB62@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <sashiko-reviews@lists.linux.dev>, "Qiliang Yuan" <odys.yuan@gmail.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf-next v3] selftests/bpf: Run the enable_stats program
 with BPF_PROG_TEST_RUN
X-Mailer: aerc 0.20.1-349-gb940a4174a3e-dirty
References: <20261019-selftests-bpf-enable-stats-inflight-v3-1-e7728f5b061a@gmail.com> <sashiko-outbox-176554@kernel.org>
In-Reply-To: <sashiko-outbox-176554@kernel.org>

On Mon Oct 19, 2026 at 2:57 AM UTC, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] selftests/bpf: deprecated CHECK() macro used in test_enable_stats=
()
> --
>
> commit 149e144806feffc72e780046d3d7759e157ee137
> Author: Qiliang Yuan <odys.yuan@gmail.com>
>
> selftests/bpf: Run the enable_stats program with BPF_PROG_TEST_RUN
>
> This commit replaces attaching the enable_stats BPF program to sys_enter
> with running it 1000 times via BPF_PROG_TEST_RUN so that concurrent
> syscalls on other CPUs do not race with reading run_cnt and count.
>
>> diff --git a/tools/testing/selftests/bpf/prog_tests/enable_stats.c b/too=
ls/testing/selftests/bpf/prog_tests/enable_stats.c
>> index 75f85d0fe74a4..5b9cc119d072d 100644
>> --- a/tools/testing/selftests/bpf/prog_tests/enable_stats.c
>> +++ b/tools/testing/selftests/bpf/prog_tests/enable_stats.c
>> @@ -5,10 +5,11 @@
>>  void test_enable_stats(void)
>>  {
>>  	struct test_enable_stats *skel;
>> -	int stats_fd, err, prog_fd;
>> +	int stats_fd, err, prog_fd, i;
>>  	struct bpf_prog_info info;
>>  	__u32 info_len =3D sizeof(info);
>>  	int duration =3D 0;
>> +	LIBBPF_OPTS(bpf_test_run_opts, topts);
>> =20
>>  	skel =3D test_enable_stats__open_and_load();
>>  	if (CHECK(!skel, "skel_open_and_load", "skeleton open/load failed\n"))
>> @@ -20,13 +21,15 @@ void test_enable_stats(void)
>>  		return;
>>  	}
>> =20
>> -	err =3D test_enable_stats__attach(skel);
>> -	if (CHECK(err, "attach_raw_tp", "err %d\n", err))
>> +	prog_fd =3D bpf_program__fd(skel->progs.test_enable_stats);
>> +	for (i =3D 0; i < 1000; i++) {
>> +		err =3D bpf_prog_test_run_opts(prog_fd, &topts);
>> +		if (err)
>> +			break;
>> +	}
>> +	if (CHECK(err, "test_run", "err %d\n", err))
>>  		goto cleanup;
>
> [Severity: Low]
> Since CHECK() is deprecated in BPF selftests, should this new check in
> test_enable_stats() (and perhaps the surrounding checks in this function)
> use ASSERT_OK(err, "test_run") instead?

bot is correct.

pw-bot: cr
