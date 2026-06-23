Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D5E395AE9
	for <sashiko-reviews@lists.linux.dev>; Tue, 23 Jun 2026 21:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782249540; cv=none; b=JdbzU5LikHP0qA3GSQ0x6M7f19wDpcOoBLaJvVzVweVZ9m7CdEPVCbCKOlGRrgQUrZNh3SnJkGXENinlvIk9JpRTmFswTGvYAPmJ0oWMbedHyulLN+a6vg0IopBXFMnSp8MyzhbRPzlpKkmkaqkJ68vhuQtVsHGDrkuUe/5OocM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782249540; c=relaxed/simple;
	bh=S1eJV4kJ7nmlMKv2y9bZFvkIcCAM5Cr9BpnHbu8WxKk=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=BrK/8koh22eUW9TdgBZAP2L76soZ6Scq3f3dCiwcCqVo9LGMbRwiC+X2EW/Z6jMokWmpp8b70ixqxoFeIgAxzpvYdFI52+7t9IX1fr/kBrydjKjHdDO24lrwxSCb6WK67iXTZ6x902QalYEoT8QFWgDLuutmSxFIDFE4IzwMnCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=STY2T2RS; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="STY2T2RS"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-30bf854d5feso676091eec.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 23 Jun 2026 14:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1782249537; x=1782854337; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J5BgpTjoZgaJ0PY0iyE7wkUjb4+de8IJta3bMQcWgWQ=;
        b=STY2T2RSEI/aMgz6KrertqOe14ZE7kXee4CIotXc4//OrwaYdjQVYaZNWwJTHkwK05
         VFCl4d15pejx0YJa12wH6z8G6Q3a17PCmU4MBixjiewsdo3wkGhBXmOBjPNadZoTh2kC
         pwsVbU53TVuEJSdmeiApg5BDRvkc78QHIUkpUHgbrFbqb530F8FusiAeTnBSiV4JZhjZ
         mIxY0//xVN8saofaa1nsR+50ndq9gRI1bQ1ZI9iMp3Q+YDNKW+bUHZ8vGF+hq5MyrCvh
         WJulRKw1ds3iqQBfSyZe/2xHnRZoC7TmxDud0BSSlpNyy0vS5v752TbBxnmML1ReJSJV
         xQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782249537; x=1782854337;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J5BgpTjoZgaJ0PY0iyE7wkUjb4+de8IJta3bMQcWgWQ=;
        b=QxYwir5Qk2NkakuYDPDS/dKjFY+rycAQhXNthAWqgXSRmSCstwRvvYHcz+nFgvcDDI
         7lttvrFYTRE1xFe725m8+f7TpX44dOhJa5RwCiJQstyIUc8/H7E6sCnQ+m3s3X6TbEG9
         Ziz1RIXtjo830MEcz8xWZXY7AfQiP2ZfsaGs4aZ7PccqeQg6CyJoajyLxAlx8brKrDOu
         0QzJ+khW4bMiVqdxw2IZjROLQ62I8DJXRNwWabpw/3ioRvc4I6ibVCYum61yiFGsqWNb
         cJuWbMLV8dD5z81rsKRSmW73djhcEmXxLmGJZM1wFMgjkEW7RaPAFuNCeJhEuS//80XM
         ajpw==
X-Gm-Message-State: AOJu0Yw7Op6y93rO6uhys0vYL803pAb9kwwfXwuJoQmgftWX6QfNmMxg
	RjeS7BxU2lztKwJi5bCQr3RthjQU8XV+v+8X+89txONMaEMjL/zHOkCHcwOWF1Ac4ubKYyH/mIK
	yZBDrbpCFLw==
X-Gm-Gg: AfdE7cm2bJHj0TVe8KCnei+zQtJOmK9M9Be1ON1VF1fkffDQotlRDMnMvzxiQTp2XOs
	JxjAfTdGUaoYgxu/H/zI+PGxHu5T2D3bkj3lELa4ruGHD+O1DAxA1zSmVwAaPEXbiTMCRNG4iLE
	EOA6v2azPHvrjM39yawmziXd7o36wYgs48EygXMeGjH8JMGbrXtdXrVAK93fF8ljKp6KhqCwBXG
	hBrUU+V57qB3zCROUg5HefBwp4SthRIHeHBAAMes2ljmu5Ok+rwIlWqbtnVK5Wa/qj+sgnpKKNO
	InA0cHm65kcGbkOIJricymqne/0xchk9W5J/P12Mipg7kb+zo6RUReUns2crvEH01vKK+nu695E
	AOKutU6gpoCjfgi1JRGiegCDVaPjzFswj7DwhttTys/ZObPfhISIn7fh1tKFI9SDUqm63Yg==
X-Received: by 2002:a05:7300:8b14:b0:30c:5534:e6f1 with SMTP id 5a478bee46e88-30c68df3b11mr792681eec.29.1782249536721;
        Tue, 23 Jun 2026 14:18:56 -0700 (PDT)
Received: from localhost ([2620:10d:c090:600::2526])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1ba1f14fsm18297838eec.5.2026.06.23.14.18.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 14:18:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Jun 2026 17:18:55 -0400
Message-Id: <DJGQQDCXHU7C.8HTXC4NI0134@etsalapatis.com>
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: <sashiko-reviews@lists.linux.dev>, "Michal Luczaj" <mhal@rbox.co>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf 2/2] selftests/bpf: Add test for UDP sock leak on
 sockmap lookup-bind-release
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260623-sockmap-lookup-udp-leak-v1-0-05804f9308e4@rbox.co>
 <20260623-sockmap-lookup-udp-leak-v1-2-05804f9308e4@rbox.co>
 <20260623190018.2B5A11F000E9@smtp.kernel.org>
In-Reply-To: <20260623190018.2B5A11F000E9@smtp.kernel.org>

On Tue Jun 23, 2026 at 3:00 PM EDT, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
>
> New issues:
> - [Medium] The cgroup file descriptor `cg` is leaked because it is never =
closed in `test_sockmap_lookup_bind_release()`.
> - [Low] The `struct sockaddr_in sa` is passed to the kernel via `xconnect=
` with uninitialized bytes in its `sin_zero` padding.
>
> Pre-existing issues:
> - [High] Calling `bpf_bind()` between `bpf_map_lookup_elem()` and `bpf_sk=
_release()` on a UDP socket mutates the socket's `SOCK_RCU_FREE` state, cau=
sing `bpf_sk_release()` to silently skip decrementing the reference count.
> --
>
> commit f32ef88a53a5c519bf4b22a337fa782c27f0ecda
> Author: Michal Luczaj <mhal@rbox.co>
>
> selftests/bpf: Add test for UDP sock leak on sockmap lookup-bind-release
>
> This patch adds a selftest to reproduce a UDP socket leak. It sets up a c=
group,
> attaches a connect4 BPF program, and triggers a sequence of socket operat=
ions
> (lookup, bind, release) that leaks the socket on an unpatched kernel.
>
>> diff --git a/tools/testing/selftests/bpf/prog_tests/sockmap_basic.c b/to=
ols/testing/selftests/bpf/prog_tests/sockmap_basic.c
>> index cb3229711f93a..11972ffdb16ed 100644
>> --- a/tools/testing/selftests/bpf/prog_tests/sockmap_basic.c
>> +++ b/tools/testing/selftests/bpf/prog_tests/sockmap_basic.c
>
> [ ... ]
>
>> @@ -1373,6 +1375,52 @@ static void test_sockmap_multi_channels(int sotyp=
e)
>>  	test_sockmap_pass_prog__destroy(skel);
>>  }
>> =20
>> +#define LOOKUP_BIND_RELEASE_CG	"/sockmap_lookup-bind-release"
>> +#define LOOKUP_BIND_RELEASE_REP	64
>> +
>> +static void test_sockmap_lookup_bind_release(void)
>> +{
>> +	struct test_sockmap_lookup_bind_release *skel;
>> +	struct sockaddr_in sa;
>> +	int cg, i;
>> +
>> +	cg =3D cgroup_setup_and_join(LOOKUP_BIND_RELEASE_CG);
>
> [Severity: Medium]
> Does this leak the cgroup file descriptor?=20
>
> The fd is acquired here and stored in cg, but close(cg) doesn't appear to=
 be
> called on either the success or error paths before the function returns. =
The
> cleanup_cgroup_environment() function cleans up directories but doesn't c=
lose
> the test's held file descriptors.
>
>> +	if (!ASSERT_OK_FD(cg, "cgroup_setup_and_join"))
>> +		return;
>> +
>> +	skel =3D test_sockmap_lookup_bind_release__open_and_load();
>> +	if (!ASSERT_OK_PTR(skel, "open_and_load"))
>> +		goto cleanup;
>> +
>> +	skel->links.connect =3D bpf_program__attach_cgroup(skel->progs.connect=
, cg);
>> +	if (!ASSERT_OK_PTR(skel->links.connect, "attach_cgroup"))
>> +		goto destroy;
>> +
>> +	sa.sin_family =3D AF_INET;
>> +	sa.sin_port =3D bpf_htons(1234);
>> +	sa.sin_addr.s_addr =3D bpf_htonl(INADDR_LOOPBACK);
>
> [Severity: Low]
> Does this leave the sin_zero padding of the sa structure uninitialized?
>
> It looks like this partially initializes the struct on the stack.
>
> [ ... ]
>
>> +		if (xbpf_map_update_elem(bpf_map__fd(skel->maps.sockmap), &u32(0),
>> +					 &sk, BPF_ANY))
>> +			break;
>> +
>> +		if (xconnect(sk, (struct sockaddr *)&sa, sizeof(sa)))
>
> When sa is passed to xconnect() here, can it leak the uninitialized paddi=
ng
> bytes from the userspace stack to the kernel?=20
>
> Would it be better to fully initialize it using "struct sockaddr_in sa =
=3D {};"
> or explicitly zero it?
>
>> +			break;
>> +	}
>> +
>> +destroy:
>> +	test_sockmap_lookup_bind_release__destroy(skel);
>> +cleanup:
>> +	cleanup_cgroup_environment();
>> +}
>

I think these issues are borderline cosmetic but valid.

> [ ... ]
>
>> diff --git a/tools/testing/selftests/bpf/progs/test_sockmap_lookup_bind_=
release.c b/tools/testing/selftests/bpf/progs/test_sockmap_lookup_bind_rele=
ase.c
>> new file mode 100644
>> index 0000000000000..cc77b193893bd
>> --- /dev/null
>> +++ b/tools/testing/selftests/bpf/progs/test_sockmap_lookup_bind_release=
.c
>> @@ -0,0 +1,37 @@
>
> [ ... ]
>
>> +SEC("cgroup/connect4")
>> +int connect(struct bpf_sock_addr *ctx)
>> +{
>> +	struct bpf_sock *sk;
>> +	int ret =3D SK_DROP;
>> +
>> +	sk =3D bpf_map_lookup_elem(&sockmap, &(int){0});
>> +	if (sk) {
>> +		if (sk =3D=3D ctx->sk) {
>> +			struct sockaddr_in sa =3D {
>> +				.sin_family =3D ctx->user_family,
>> +				.sin_port =3D ctx->user_port,
>> +				.sin_addr.s_addr =3D ctx->user_ip4
>> +			};
>> +
>> +			ret =3D !bpf_bind(ctx, (struct sockaddr *)&sa, sizeof(sa));
>> +		}
>> +
>> +		bpf_sk_release(sk);
>
> [Severity: High]
> This is a pre-existing issue, but does calling bpf_bind() here mutate the
> SOCK_RCU_FREE state and cause bpf_sk_release() to skip decrementing the
> reference count?
>
> If bpf_map_lookup_elem() looks up a newly created UDP socket, SOCK_RCU_FR=
EE
> is not yet set, so sk_is_refcounted() evaluates to true and the reference
> count is incremented.
>
> Then bpf_bind() resolves to udp_v4_get_port(), which dynamically sets the
> SOCK_RCU_FREE flag on the socket.
>
> When bpf_sk_release() is called, it evaluates sk_is_refcounted() again. B=
ecause
> SOCK_RCU_FREE is now set, it evaluates to false, causing bpf_sk_release()=
 to
> skip the sock_gen_put() call and permanently leak the socket reference.
>

AFAICT this is actually not a problem for this specific test, because we
fix it in patch 1/2. We have already added the socket to the sockmap so
udp_bpf_update_proto should have triggered. It looks like Sashiko missed
this?

Specifically for UDP, I think the code is fine.

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

>> +	}
>> +
>> +	return ret;
>> +}

