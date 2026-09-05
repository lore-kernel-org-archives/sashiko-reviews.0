Received: from mail-wr2-f10.google.com (mail-wr2-f10.google.com [74.125.225.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AA743A80B
	for <sashiko-reviews@lists.linux.dev>; Sat,  5 Sep 2026 07:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788592563; cv=none; b=aK5uNVOOBy/5JcWbmnuk0G4z4byRN/Iyo3iM90JR+ANc1Db70MjdWa4rvl4X0o0bOMzQcZqreOphR3nNsGEDEzY8p6LxKwV32+WZWvIsJirkbntV5aaR5zYbO8TpOVhkQEEY4ecIBrBkMM2S2pAjWe5CKP7gNWJEd/A1B9Jxgac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788592563; c=relaxed/simple;
	bh=FX2z931M9bUttii0UU8Rxzxn177SaoIQJPoFDP9gTnI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=BkMsl66pOyd3IQ0c9v9JCV2ULoQeSqj7i33yKCX51Z7Q59oF/wm7JpOab7M5JXOpb55lQNpd4nglDkq17248ZBGLJxSJgKn9bo4oJU1V0zExTJuElPae6oTrYJKVQd+JXynRyt56veM0YV6ocDhQ2dswaKYFukSk8ueUXVjeRlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KXPXXQKZ; arc=none smtp.client-ip=74.125.225.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KXPXXQKZ"
Received: by mail-wr2-f10.google.com with SMTP id ffacd0b85a97d-484373a2e82so657722f8f.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 05 Sep 2026 00:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788592560; x=1789197360; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hxyD4Yj6WI8bWk1StHSNdl357kbrjo2XLmREUE/sN4U=;
        b=KXPXXQKZlGcJfeaumKieTRc6Hu7CCrvt5s49FsdPAtN0ClCSZMExi29O5HHU0/XvH0
         2nGFaKNSqt0vfScrYb+ELKgIXOYkupKbTwiUm7PnH+a5qs5YxrvQfxo/o//QpDQQ/UnU
         TjmNjHX4TPz+bBtqoRqkDn77UKH4bzL9KecnPA5JoN7PiOFq8Jcdr3nZ+8mEmTlMJWtQ
         VyekOGb6WLhTJnpEGFfhK0b400cYiKa+hxbx4J6I7MUQBG56EUzLRFS3sH+ycuTYcUzZ
         WhMkbAaPUYPd2ZvR7lbQ9+FpNOZfKr/j6RalvrgxFVJGYO7IPYWdKQens4JXA54UGG1W
         1zWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788592560; x=1789197360;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hxyD4Yj6WI8bWk1StHSNdl357kbrjo2XLmREUE/sN4U=;
        b=gCFnPGGMChSQyJI6kNtX3qqGMvb8/vmI317ilZ8fR0K2XeaBDZrKWN7WQfcw0ofDGA
         IwGWW273s6GLzcDEhcQPDTIG5Bp5gHgI5FHF5wv83q9luQk2v3DBUA4ge1AtISmVe5Rm
         AZw8gjyFGAWQ0ttycKU1f4S9shFj7kTwpFDDC5EeIkxtWSmgICrxAXy64TO8TGaIyKQ/
         B85vbGyj6ZJplnlvKu/GadYpw3u0plU+xcjEMCOG7pxdp7HsfIC5TAN6VEMWk5sVYTRN
         tehmb4ev5Kc59zMW8+JntO5YPiL3XWVhT+T29PSKXNeqzvaOjE2AgBqwQwI+alBdoIpd
         UBTw==
X-Gm-Message-State: AFuF++kdqNGtLMlQ2uBs0T83rbJTAGE+RHzGDOpvgaf3QjsVYcanpPQn
	awlvZ0Y++U2EJHCiNl6YVlVdBbpmRI60Beob292euG9U0pQi4NlL5Y/B6JHbCx1q
X-Gm-Gg: AYBFou1lTYPHPuVbIa8wEi2lvt2CsaTj1LXu9+Xkg4tCBoLenY1W6Vpm1qKv1bLu+YO
	06CtrIpHI4czZfoa0BJ4eekXLkUsrKeRpoHL7cAd2PhGH9hcpVBJAcp8+OGoOE5f5iQgh90hvMs
	MPtASCavkTTk+Isa4i9ORkS1P6cwujXfHICMoxYblqosOjkERGO2uQ7OSc6NgjO6DAs6yrONAr2
	yQbdj2Aw0lTYgamQ6bPUYo1L/2xrWv3kksaBFkNm6wBqBdl4RuyImyI5nAYYCRG8GK7TngaSfXs
	QmP7G0sDgGQ1BIjyRrRjZzIPxT1AcpR7WrcvBfWTwd+JsyoPC+U3ofXKjxvC3x00iRK2uMUw8fK
	LZqHYOW3YKcm56dkwoVROJe1MFgxcyvCYlbLruB/6Qs8Xa6I7UsL3rHoTwsMPWnVVAFk412vH8C
	yYh+aHvtJby20Dawo/jzyarZtlgtaD+vEqKH5CR03Py2SSO1ESJQNqctUaP9Hnjs94b/nx3mFMd
	uLkyyeXxKRca0zV5j0JeFGV90YkKbxFVdte5VOVuGTfdJ6YSIXor/nfBJc+D6RHgYJu5juI5ziZ
	dRNfh9x2K0tGGTcY5073qqIrLW0=
X-Received: by 2002:a5d:588f:0:b0:485:847f:fd9b with SMTP id ffacd0b85a97d-48586e4a62bmr19188686f8f.6.1788592560006;
        Sat, 05 Sep 2026 00:16:00 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfe14sm12352166f8f.35.2026.09.05.00.15.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2026 00:15:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 05 Sep 2026 09:15:59 +0200
Message-Id: <DL775AF87XMV.37IX3GZVA1N2H@gmail.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf v1 2/8] selftests/bpf: Test killing a loader during
 instruction rewrites
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: <sashiko-reviews@lists.linux.dev>
X-Mailer: aerc 0.21.0
References: <20260905070003.3193366-1-memxor@gmail.com>
 <20260905070003.3193366-3-memxor@gmail.com>
 <20260905071354.9089C1F00A3D@smtp.kernel.org>
In-Reply-To: <20260905071354.9089C1F00A3D@smtp.kernel.org>

On Sat Sep 5, 2026 at 9:13 AM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Race condition causing false test failures on extremely fast h=
ardware or optimized verifiers.
> --
>
> commit e86296a4aae66b4d0778df9e0379e5e9bc8a6bff
> Author: Kumar Kartikeya Dwivedi <memxor@gmail.com>
> Subject: selftests/bpf: Test killing a loader during instruction rewrites
>
> This commit adds a selftest to verify that a child process stuck in the
> verifier's quadratic instruction rewrite phase can be successfully termin=
ated
> by a fatal signal.
>
>> diff --git a/tools/testing/selftests/bpf/prog_tests/prog_load_signal.c b=
/tools/testing/selftests/bpf/prog_tests/prog_load_signal.c
>> new file mode 100644
>> index 0000000000000..0f78db3bccc76
>> --- /dev/null
>> +++ b/tools/testing/selftests/bpf/prog_tests/prog_load_signal.c
> [ ... ]
>> +	if (!pid) {
>> +		close(pipefd[0]);
>> +		if (write(pipefd[1], "x", 1) !=3D 1)
>> +			_exit(1);
>> +		close(pipefd[1]);
>> +		prog_fd =3D bpf_prog_load(BPF_PROG_TYPE_SOCKET_FILTER, NULL, "GPL",
>> +					insns, NOP_CNT + 2, NULL);
>> +		if (prog_fd >=3D 0)
>> +			close(prog_fd);
>> +		_exit(prog_fd < 0);
>> +	}
>
> [Severity: Medium]
> Could the child process exit too quickly on very fast hardware or with an
> optimized verifier? If the child completes the load before the parent sen=
ds
> SIGKILL, it will exit normally and become a zombie.
>
> [ ... ]
>> +	/*
>> +	 * Allow linear verification to finish before sending SIGKILL. The nop
>> +	 * removal pass is quadratic, so four control-load times still leaves =
a
>> +	 * wide window in which an affected kernel is rewriting instructions.
>> +	 */
>> +	kill_delay =3D MAX(control_time * 4, MIN_KILL_DELAY_NS);
>> +	sleep_ns(kill_delay);
>
> Here, kill_delay enforces a minimum delay of 100ms (MIN_KILL_DELAY_NS). I=
s it
> possible that on modern CPUs with high cache bandwidth, the verifier's 32=
,768
> instruction rewrite could finish in under 100ms?
>
> If control_time is very small, the parent will sleep for 100ms, which mig=
ht
> give the child ample time to finish bpf_prog_load() and exit.
>
> [ ... ]
>> +	start =3D monotonic_ns();
>> +	ret =3D waitpid_timeout(pid, &status, REAP_TIMEOUT_NS);
>> +	if (!ASSERT_EQ(ret, pid, "prog_load_killable")) {
>> +		fprintf(stderr, "control load %llu us, child still alive %llu us afte=
r SIGKILL\n",
>> +			control_time / 1000, (monotonic_ns() - start) / 1000);
>> +		goto cleanup;
>> +	}
>> +	pid =3D -1;
>> +	ASSERT_TRUE(WIFSIGNALED(status) && WTERMSIG(status) =3D=3D SIGKILL,
>> +		    "killed_by_sigkill");
>
> If the child finished early and exited normally as described above, waitp=
id
> will retrieve a normal exit status. This assertion will then incorrectly =
fail
> because the child wasn't killed by the signal.
>
> Could this lead to flaky test failures on fast CI machines?

I tested this locally and it works well, so the test was at least useful in=
 that
regard. It is plausible it ends up being flaky (doens't seem to be right no=
w), I
will leave it for the final person applying to decide whether to skip this =
patch
in the series or not.

