Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C3F30BF6D
	for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 22:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784585838; cv=none; b=WCem8Vyo+nvf33CHjPjW7nlWVbDsgulVgQ7EImynvOizSKXfTTCJkk0rYtGbpwxHaq7HCqhQdNPnR2/yP+OkJvxcjpIISZksf25lYI44ihlZ1eoWB0K08vGNew6fxWXN1woPz9qwxjaFcIUcPnFRzl86PHNQHcAUFyiOJMMk9uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784585838; c=relaxed/simple;
	bh=1xpjo34pnCi231dSMDoB9YkmE0NpatqM4EsxY1S/6LU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=JS+c8Lp0UrVDmmGIhfNJgfidNtVPeFDHPexwAIpvs0Re3vndf4pCRVpRQQsajDN5H82nkszQ9ScgMzuRq/kBAiakFe3ISBK2UTMHefjhm0+uAOKZ8F9ZFQKHO2Oh0rNs6/+6T7rMqqAi0Hn9bOorRTQah6Y77Fo42aRMEwjt52w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=hl9YMuf8; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="hl9YMuf8"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-848d21bbaffso10604731b3a.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 15:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1784585836; x=1785190636; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=guTJGgAX3t3ZDnVwO8Kbu3t9c+ccuN0bA05N3oZ321c=;
        b=hl9YMuf8kUVIfhRhDPURaAgmonVv9nxqrqMOP/D5c644XaFumXqSGEFzW15GtCFU1+
         FkGNy2ACL8JRWbLtcM+jptIWxFw0hlFJaJE26KUJwgsVymaUt3xi8ky8dPoea70yJPJc
         MNHu0WktkwOff5CeL7k1H/cavc+WEf3O72wPnzViGgH+LLKUlXExq0biuMMk9Z6EoOOP
         lXaZJ8kTfER0sv8c+a/G1Y6yLjumiDa5qfKXy6j9P23XNauWzEPSmmC1TEn+JQgYXdks
         BwPX+JO/TpnNo/l/fkxYTHm/ToMA2qJqHchq06DgsCXxvJTRp/NXZNBIBQyTvtP8yaO+
         1nxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784585836; x=1785190636;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=guTJGgAX3t3ZDnVwO8Kbu3t9c+ccuN0bA05N3oZ321c=;
        b=gYCk6na9DIEGTW1rzoBPsZybXz3EeYMAQLHOodOYM+Dp5kxcaxUQ4PFZF/4EEzx3IC
         iY2Qz1x/5LBwTLazibEeF29v98+6LVZdMcFm+d3mcAroRnhGWcPh3ZuWRZOzbskfFvCW
         5cBFKdKqLavbVtnLxhtAtWrSxoN125eUI+BKrQ0DuBTfKjWJ5Dk1K6GbcmezHzG/1ukl
         XndrWYNDRH205qQbfot5tvnWOwFEneYNd/jyUrNKc4bvEDSxYkJusEC403jgoYL9X0S2
         oOjE88tYCeOt6n0GAT8vIDCqDjGacFryPFVWt61Go92YmP+ccTOb5AP2V1LmvumZNQs7
         1M9Q==
X-Forwarded-Encrypted: i=1; AHgh+RrBhRJaEn7/SHzBBRLN2WzhSEba3mOMLm6T0+rcv/CdDrIdaiSUJMRzKFoZq3b+4gVnCQTSoo/axt1wpLcJ3UM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz40VPd0A0w2q9brlMD8W+FmLO/BgNHFGV3W6vTgoU9u4gNQrX9
	xU6xRB/jFitrXr7PkSR7lDTiXn5jBJqRegwOY4FrxnHyT0V7uu3cF1HHMxCm1rrip6w=
X-Gm-Gg: AfdE7cmhzjAITC+5Ikxw1mNKBhw1B8FLVWKgDFz6iYg01pBbqCBqVeRGQ9HJPc8zJz6
	aem9UVJKlMsyKXhrzTkWNvkOIaajxnVITyCgkx328aH2VjeEgZZwxkE80SBzjHGSyNEWP/fCi+r
	NEKrLPjP5ibCDiZ/Puf3Xhgiey1j/XtQ9GBjzKsQB4z2KCJAF3zfXRbd5kInzw8XcHTmTHJAiz0
	SEc5kKRdvEIVcPXXqaOqtOoZ8m2+dpYO47zlMmLOu3LWqsuKnE+S8Fg3Uxv+suIjcPQqZ1Nlqj/
	ei5KEPhY5dRagoSWLH65Gc8uPNMaLaqJKv4hhyIixQfj9Q/1f0lqvzzWu29Rtfs5lbXum4RfJD9
	83U3dlGaB+vCsl7IaYCrIitMr1eT0Hu8yoVpRheFcfVFri5ZWJ/ZyuIsVSEzvbOD8scJ/4Jj/4h
	LW4rcDU7dv9PX/Ye4MlJf2tydCwbrxgRo=
X-Received: by 2002:a05:6a00:368b:b0:82f:3a1e:5618 with SMTP id d2e1a72fcca58-84c29287a8dmr16559044b3a.22.1784585835659;
        Mon, 20 Jul 2026 15:17:15 -0700 (PDT)
Received: from localhost (107-190-31-17.cpe.teksavvy.com. [107.190.31.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af9ef6dsm6303201b3a.57.2026.07.20.15.17.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 15:17:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Jul 2026 18:17:14 -0400
Message-Id: <DK3QVQIY0IR8.3VNI3HHRJ6FQN@etsalapatis.com>
Cc: <bpf@vger.kernel.org>, <davem@davemloft.net>, <edumazet@google.com>,
 <horms@kernel.org>, <jakub@cloudflare.com>, <jiayuan.chen@linux.dev>,
 <john.fastabend@gmail.com>, <kuba@kernel.org>, <kuniyu@google.com>,
 <ncardwell@google.com>, <netdev@vger.kernel.org>, <pabeni@redhat.com>,
 <sashiko-reviews@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 2/2] selftests/bpf: add sockmap recvfrom EAGAIN
 selftest
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Nnamdi Onyeyiri" <nnamdio@gmail.com>
X-Mailer: aerc 0.20.1
References: <20260720171535.67867-1-nnamdio@gmail.com>
 <20260720171535.67867-3-nnamdio@gmail.com>
 <DK3Q8PFVGNAV.GZNZC89346A9@etsalapatis.com>
 <al6amg9-PpZVpQyN@localhost.localdomain>
In-Reply-To: <al6amg9-PpZVpQyN@localhost.localdomain>

On Mon Jul 20, 2026 at 6:07 PM EDT, Nnamdi Onyeyiri wrote:
> On Mon, Jul 20, 2026 at 05:47:09PM -0400, Emil Tsalapatis wrote:
>> On Mon Jul 20, 2026 at 1:15 PM EDT, Nnamdi Onyeyiri wrote:
>> > These selftests exercise the tcp_bpf_recvmsg() and tcp_bpf_recvmsg_par=
ser()
>> > functions, to ensure that they are properly handling spurious wakeups =
in
>> > tcp_msg_wait_data().
>> >
>> > The expected behaviour is that recvfrom() does not return an EAGAIN
>> > error.  If the spurious wakeups are incorrectly handled, this assertio=
n
>> > will fail.
>> >
>> > Signed-off-by: Nnamdi Onyeyiri <nnamdio@gmail.com>
>>=20
>> The test looks fine, even if slightly flaky. Running with only patch 2/2
>> still passes sometimes on my box. Can we handle this somehow, e.g., do
>> more attempts?
>>=20
>> There's also a couple magic numbers in the tests that may need some
>> explanation (noted below).
>>
>
> Thanks for the review!  I'll attach an explaination to the numbers.
> Essentially the larger the payload the fewer iterations seemed to be
> required to reproduce (on my machine).
>
> With the issue fixed though, larger payloads and more iterations make
> the test run longer.  Is there is a rule of thumb I should follow for
> tuning the runtime?

Unfortunately there's no fixed rule, I'd say the two requirements are:
a) The test should not be flakey, esp. false positives are a no-go.
b) The test shouldn't add noticeable latency to the testbench.

As it stands the test is fine, since the main issue is a false negative
(the test spuriously passes without the fix). That's still an issue, but
as long as the test without the fix properly fails the vast majority of
the time I think think it's fine.

>
>> > ---
>> >  .../selftests/bpf/prog_tests/sockmap_basic.c  | 124 +++++++++++++++++=
+
>> >  1 file changed, 124 insertions(+)
>> >
>> > diff --git a/tools/testing/selftests/bpf/prog_tests/sockmap_basic.c b/=
tools/testing/selftests/bpf/prog_tests/sockmap_basic.c
>> > index cb3229711f93..d18faf46fac0 100644
>> > --- a/tools/testing/selftests/bpf/prog_tests/sockmap_basic.c
>> > +++ b/tools/testing/selftests/bpf/prog_tests/sockmap_basic.c
>> > @@ -1373,6 +1373,126 @@ static void test_sockmap_multi_channels(int so=
type)
>> >  	test_sockmap_pass_prog__destroy(skel);
>> >  }
>> > =20
>> > +static void *test_sockmap_recvfrom_eagain_thread(void *arg)
>> > +{
>> > +	int fd =3D *(int *)arg;
>> > +	char buf[1024];
>> > +	void *result =3D NULL;
>> > +
>> > +	while (true) {
>> > +		ssize_t len =3D recvfrom(fd, buf, sizeof(buf), 0, NULL, NULL);
>> > +
>> > +		if (len =3D=3D -1) {
>> > +			if (errno =3D=3D EINTR)
>> > +				continue;
>> > +			result =3D (void *)1;
>> > +			break;
>> > +		}
>> > +
>> > +		if (!len || buf[len - 1] =3D=3D 'e')
>> > +			break;
>> > +	}
>> > +
>> > +	send(fd, "test", 4, MSG_NOSIGNAL);
>> > +
>> > +	close(fd);
>> > +
>> > +	return result;
>> > +}
>> > +
>> > +static void test_sockmap_recvfrom_eagain(bool with_verdict)
>> > +{
>> > +	struct test_sockmap_pass_prog *skel =3D NULL;
>> > +	struct bpf_program *prog =3D NULL;
>> > +	size_t buflen =3D 1024 * 1024 * 25;
>>=20
>> Here
>>=20
>> > +	char *buf =3D NULL;
>> > +	int map, err;
>> > +
>> > +	skel =3D test_sockmap_pass_prog__open_and_load();
>> > +	if (!ASSERT_OK_PTR(skel, "open_and_load"))
>> > +		return;
>> > +
>> > +	map =3D bpf_map__fd(skel->maps.sock_map_msg);
>> > +
>> > +	if (with_verdict) {
>> > +		prog =3D skel->progs.prog_skb_verdict;
>> > +		err =3D bpf_prog_attach(bpf_program__fd(prog), map, BPF_SK_SKB_STRE=
AM_VERDICT, 0);
>> > +		if (!ASSERT_OK(err, "bpf_prog_attach verdict"))
>> > +			goto cleanup;
>> > +	}
>> > +
>> > +	buf =3D malloc(buflen);
>> > +	if (!ASSERT_OK_PTR(buf, "malloc buf"))
>> > +		goto cleanup;
>> > +	memset(buf, 0, buflen);
>> > +	buf[buflen - 1] =3D 'e';
>> > +
>> > +	for (int i =3D 0; i < 200; ++i) {
>>=20
>> Also here. Why 200 iterations specifically? Can we at least name the
>> defaults to make it clearer that we've chosen those numbers because
>> that's how we trigger the bug?
>>=20
>> > +		ssize_t sent;
>> > +		char ignored[128];
>> > +		pthread_t thread;
>> > +		bool thread_created =3D false;
>> > +		size_t rem =3D buflen;
>> > +		int c =3D -1, p =3D -1, zero =3D 0;
>> > +		bool success =3D false;
>> > +
>> > +		err =3D create_pair(AF_INET, SOCK_STREAM, &c, &p);
>> > +		if (!ASSERT_OK(err, "create_pair"))
>> > +			goto end_attempt;
>> > +
>> > +		err =3D pthread_create(&thread, NULL, &test_sockmap_recvfrom_eagain=
_thread, &p);
>> > +		if (!ASSERT_OK(err, "pthread_create"))
>> > +			goto end_attempt;
>> > +		thread_created =3D true;
>> > +
>> > +		err =3D bpf_map_update_elem(map, &zero, &c, BPF_ANY);
>> > +		if (!ASSERT_OK(err, "bpf_map_update_elem"))
>> > +			goto end_attempt;
>> > +
>> > +		while (rem) {
>> > +			sent =3D xsend(c, buf + (buflen - rem), rem, 0);
>> > +			if (sent =3D=3D -1)
>> > +				goto end_attempt;
>> > +			rem -=3D sent;
>> > +		}
>> > +
>> > +		/* we cannot use recv_timeout(), otherwise EAGAIN would be an expec=
ted errno. */
>> > +		err =3D recvfrom(c, ignored, sizeof(ignored), 0, NULL, NULL);
>> > +
>> > +		/*
>> > +		 * we are checking for the invalid return of EAGAIN, any other retu=
rn is considered
>> > +		 * successful for the purposes of this test.
>> > +		 */
>> > +		if (err < 0 && !ASSERT_NEQ(errno, EAGAIN, "recvfrom eagain"))
>> > +			goto end_attempt;
>> > +
>> > +		success =3D true;
>> > +
>> > +end_attempt:
>> > +		if (c >=3D 0)
>> > +			close(c);
>> > +
>> > +		if (thread_created) {
>> > +			void *retval =3D NULL;
>> > +
>> > +			pthread_join(thread, &retval);
>> > +			if (!ASSERT_NULL(retval, "retval"))
>> > +				success =3D false;
>> > +		}
>> > +
>> > +		if (!thread_created && p >=3D 0)
>> > +			close(p);
>> > +		if (!success)
>> > +			break;
>> > +	}
>> > +
>> > +cleanup:
>> > +	if (buf)
>> > +		free(buf);
>> > +
>> > +	test_sockmap_pass_prog__destroy(skel);
>> > +}
>> > +
>> >  void test_sockmap_basic(void)
>> >  {
>> >  	if (test__start_subtest("sockmap create_update_free"))
>> > @@ -1451,4 +1571,8 @@ void test_sockmap_basic(void)
>> >  		test_sockmap_multi_channels(SOCK_STREAM);
>> >  	if (test__start_subtest("sockmap udp multi channels"))
>> >  		test_sockmap_multi_channels(SOCK_DGRAM);
>> > +	if (test__start_subtest("sockmap recvfrom eagain"))
>> > +		test_sockmap_recvfrom_eagain(false);
>> > +	if (test__start_subtest("sockmap recvfrom eagain with verdict"))
>> > +		test_sockmap_recvfrom_eagain(true);
>> >  }
>>=20

