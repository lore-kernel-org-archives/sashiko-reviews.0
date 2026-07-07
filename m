Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEF5343883
	for <sashiko-reviews@lists.linux.dev>; Tue,  7 Jul 2026 14:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783433611; cv=none; b=oBG9m+qklXSUVKKu5ZWQKfQJBGXtl9m7L6szqI5M4kpTiIvP7SpCq1eFAsN82j/1kq8hZSrMMnFODSYHV9vrXBI1zJhe447XGx74cbEbCw7s7oFw8v2hAbCp9udLBnzG3YlrhX7ew6+gL1T/HPZq0GAxCse10hLoN4xTCsPRY1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783433611; c=relaxed/simple;
	bh=dPS9ZgYAMd5YuvueUQdL8LOB8ojuGH4+mjUR3LwKanw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=XHG3I1wqz2lg61S2ATVRk2gu0x96F/Kwv0IlDMGLipDfQHuADyZvmzeYwkE9fwta8TdTxQlK8AQakUt/j/eFtmfAR27BAmI4083xdEVMCi11MVunHLBagVehhlh0IphiMg41fD+CgAK4nnJT2Y4PdPDcx6R+ZZDbzNxAgU9zAiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=AwDasGWX; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AwDasGWX"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3ACBF4E40CAF
	for <sashiko-reviews@lists.linux.dev>; Tue,  7 Jul 2026 14:13:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0751A60333;
	Tue,  7 Jul 2026 14:13:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3429E11BC257C;
	Tue,  7 Jul 2026 16:13:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783433605; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qZ9TwXJd/yr9cPHSyFoGhLXSwzdQUPQHdgEe9o4i6cs=;
	b=AwDasGWXtyZMovAhoiDZB3tUgzmjdxIgrIYVZmAhCGW/8iZIsYRuE1h8gOV4ZcZReMxkdF
	TlU92vUxGNeVBqxdA0XSAy+ZrfhGNZ5NmHOaVmP2a5JCm/L9oGbDw5tzjCq6KHdZjfcElV
	xP71B+Ld4d+u3PzQiOjwzNJFvJ354Ix2GN7kPTwbZ4Cp3YtVyDsnofgN4fZB+sHHjpRgtQ
	bur4gNdH8p1dmfpaJBMy0PA3hKB3X9XU5rr+p5isTdYDPE5OH1Be4THOiSS638s3vrMzUa
	CY/0x+nwN1Z+pSOit2eZfoJV7SiOdo1Bky4yzFS1eEWQqt8pLosM4H6R2Dd2bg==
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Jul 2026 16:13:24 +0200
Message-Id: <DJSEG7DCNE1G.G2EYFS9AQENJ@bootlin.com>
Subject: Re: [PATCH bpf-next v3 10/10] selftests/bpf: add tests to validate
 KASAN on JIT programs
Cc: <bpf@vger.kernel.org>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <sashiko-reviews@lists.linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260701-kasan-v3-0-bd09bb942d86@bootlin.com>
 <20260701-kasan-v3-10-bd09bb942d86@bootlin.com>
 <20260701103414.03E1C1F00A3A@smtp.kernel.org>
In-Reply-To: <20260701103414.03E1C1F00A3A@smtp.kernel.org>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Jul 1, 2026 at 12:34 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] Uninitialized stack memory is passed to the kernel via bpf_pro=
g_test_run_opts, causing potential information leaks and triggering MSAN wa=
rnings.
> - [Medium] The KASAN report parser is susceptible to spurious failures du=
e to kernel log interleaving.
> --
>
> commit e974c567c6b3da1ae6e1c27c442840d9bd396091
> Author: Alexis Lothor=C3=A9 (eBPF Foundation) <alexis.lothore@bootlin.com=
>
>
> selftests/bpf: add tests to validate KASAN on JIT programs
>
> This patch adds a basic KASAN test runner that loads and test-runs BPF pr=
ograms
> designed to trigger memory management bugs. The test captures kernel logs=
 and
> ensures the expected KASAN splat is emitted by searching for the correspo=
nding
> first lines in the report.
>
>> diff --git a/tools/testing/selftests/bpf/prog_tests/kasan.c b/tools/test=
ing/selftests/bpf/prog_tests/kasan.c
>> new file mode 100644
>> index 0000000000000..ff070c39eaac1
>> --- /dev/null
>> +++ b/tools/testing/selftests/bpf/prog_tests/kasan.c
>
> [ ... ]
>
>> +static int check_kasan_report_in_kernel_logs(char *buf, struct test_ctx=
 *ctx,
>> +					     bool is_write, int size)
>> +{
>> +	char *access_desc_start, *access_desc_end, *tmp;
>
> [ ... ]
>
>> +	/* Find next line */
>> +	access_desc_start =3D strchr(kasan_report_start, '\n');
>> +	if (!access_desc_start)
>> +		return 1;
>> +	access_desc_start++;
>> +
>> +	access_desc_end =3D strchr(access_desc_start, '\n');
>> +	if (!access_desc_end)
>> +		return 1;
>> +
>> +	nsize =3D snprintf(access_log, READ_CHUNK_SIZE, KASAN_PATTERN_REPORT,
>> +			 is_write ? "Write" : "Read", size);
>> +
>> +	tmp =3D memmem(access_desc_start, access_desc_end - access_desc_start,
>> +		     access_log, nsize);
>
> [Severity: Medium]
> Could this fail if other kernel components interleave log messages betwee=
n the
> KASAN header and the access description?
>
> The parser assumes the exact next newline-delimited block contains the ac=
cess
> description. However, the report_lock used by KASAN internally only seria=
lizes
> KASAN reports with each other, not with general printk output from other =
CPUs
> or contexts. If another component prints a message precisely between the =
KASAN
> header and the access description, the search bounds might be restricted =
to an
> unrelated interleaved log line, causing memmem() to fail and making the t=
est
> flaky.

Indeed. I'll update this to search _in the rest of the logs_ rather than
_on the very next line_, assuming that each subtest generates at most a sin=
gle
report.

Alexis


--=20
Alexis Lothor=C3=A9, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

