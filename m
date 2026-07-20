Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345A242BEAD
	for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 21:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784584035; cv=none; b=lUtbuZ+fpzTbDadfNCpyCAYc6WUAOVbioqj5/e79ppNNXfQoLF1A8UR7NEyhFdSRgIhCCGCEZoOn6Dmb4Eop8v0DCNnr70VW8D3sXrYbLRKrQxycIwCNyrn8B0fmSRddNxDSzQvopVoMoqhMysE+glSaP8YDs80FLboKph2cVVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784584035; c=relaxed/simple;
	bh=7gQY7AlbHewQtnIWDwf6xeKE5zm3O+CvGwbpF1ZE6m0=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=jbI0j8xQmAH0lCBLAdVb0oolpCYfyKAVslZgE92UBTpWPSZeKtd/qvxARdu2pixyqmUlWJMo28imoemW9c/mTPpmjqIL6oDrC+mFcBdxFReUgDVQ2wuIwV3r6aiE267gud2dC/C7uuSQuIfCJYwnEP25//iK1YCzZjTMp89jMVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=eKGz2jC2; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="eKGz2jC2"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-848479c9bd5so4799721b3a.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 14:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1784584031; x=1785188831; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SxhXZCE8F/8NLGo9T+1i7MwIlRVltbKl0w04IWFpO+Q=;
        b=eKGz2jC2vXVBVIzkI8uOkbHtmLQ6T1bZs+UcY0534UPClX20GgpSONoL2lXREiySH8
         v+FN3qPsg8Rhmhui4q885xJpdKVx6+Vnvzx8zdHtDNsRA4vMWN8+MEt0TSS7+r8KgD4v
         q2go2q85Jg0s9rb6jOpXEou0wbkEZY3QtJ2GSDrOG8t1MTYlY1jLvhkh3gQ4+le//+9K
         tfql5et/RJC1lxOR5YtUVpnsflCIq9a13MtiGyCB5ciWwx5kMWjyT/uFBHvY9qeJEMiO
         kQK0Kd/rFwcqTDFeOkLFVjPqbY+mxjekVOhTo74xnM/9kfjcFXYZxN+Ei1RuN9D/BcCj
         FEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784584031; x=1785188831;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SxhXZCE8F/8NLGo9T+1i7MwIlRVltbKl0w04IWFpO+Q=;
        b=ilpubLfkrv4ivIFLuWanNycQBjwvUBN/jd7LOMuIFPY6WzUkmYKN3JZKhGBxiQo8LF
         GBG4Vnu044U/QjYmsOZtyEVghwUG3pVZCc2LGhFSAXnlXJltkDaJHZzMJxTK5z3BT3cw
         YNstnK8aqG2llpibG6rHnZ39awvNe7Zejx0X0oausuYsh4FXxlV0gFTfv4MoV3oScEIx
         91UtFumC/+gLNbTG0sd8BibqOcnE1QsaO9H/s+x5xbmQ/4wDGBjdagJmKeR1oeen+XA/
         GQTLnsa78fKKnNvQFE3Ex3cxi81l24rGRKi0o9N261BsyLOgPhy14evvt8iwS4iMXOtU
         8Yjg==
X-Forwarded-Encrypted: i=1; AHgh+RqVujctJJM2mTAvrx9aY5SZB9ZSAItJLMO1xRM2crc5+/3rZ6VOYnqDUwv0QASZfLcJewb5n3CFiADTajE8chM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwuOeBJKJiRYa291bY5Vx+xGuoRtWCsff/ZvlkVFXJyVRF801iS
	TKR2zfdQJKmpWEkS8r030B/WD82NFbxBRZVx5gqDmIF18nHgb/+GkZPtXffjhrEPtW4=
X-Gm-Gg: AfdE7cnwR33mLhsGzy51NYIHLg199pCW2RCkEO2JO2nntgdBEikh2+lJLGkcyEOGtRY
	pn96x87X85maGXGCU2CvfaXgQBmpG9GniRstdeS2AGQcj5z/I15iA03mne/SfhpjAWMJ5i4qTeM
	uj5QccopJJGh7QEY201bunQc92nyy2LNYqQ5rX/fsa+saKsH5NHmvSNL/yDfrCc4x+dPNFdiEWX
	9zKYwwlFSXJMl2fuuS3a5tXr2rPcxu4cLnVApzlvQOVHG1d1ykIds5NXy4Mz+j5aTZ9OHmj3QIc
	900lQHT6OjPC5ugnDgXqglSvE3ZeX3oQuY5Ww1ugIl3U5xA/M0YyCuXa7mx8vnhE424vn/XkOc8
	1kMJOyz0gCK/GnCnD7o7B5VmF8KSkgkarqwGu5EVCHboeWJk5ddE6ZBSRE5Ex3CEVHruvr4GbEn
	kvJfXrAzrzLDrcSgtEabn3wkjFOo5fHd4=
X-Received: by 2002:a05:6a00:4ace:b0:848:48e7:437b with SMTP id d2e1a72fcca58-84c294c5fe9mr14998819b3a.69.1784584030880;
        Mon, 20 Jul 2026 14:47:10 -0700 (PDT)
Received: from localhost (107-190-31-17.cpe.teksavvy.com. [107.190.31.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adcaa0bsm6322022b3a.20.2026.07.20.14.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 14:47:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Jul 2026 17:47:09 -0400
Message-Id: <DK3Q8PFVGNAV.GZNZC89346A9@etsalapatis.com>
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Nnamdi Onyeyiri" <nnamdio@gmail.com>
Cc: <bpf@vger.kernel.org>, <davem@davemloft.net>, <edumazet@google.com>,
 <horms@kernel.org>, <jakub@cloudflare.com>, <jiayuan.chen@linux.dev>,
 <john.fastabend@gmail.com>, <kuba@kernel.org>, <kuniyu@google.com>,
 <ncardwell@google.com>, <netdev@vger.kernel.org>, <pabeni@redhat.com>,
 <sashiko-reviews@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 2/2] selftests/bpf: add sockmap recvfrom EAGAIN
 selftest
X-Mailer: aerc 0.20.1
References: <20260720171535.67867-1-nnamdio@gmail.com>
 <20260720171535.67867-3-nnamdio@gmail.com>
In-Reply-To: <20260720171535.67867-3-nnamdio@gmail.com>

On Mon Jul 20, 2026 at 1:15 PM EDT, Nnamdi Onyeyiri wrote:
> These selftests exercise the tcp_bpf_recvmsg() and tcp_bpf_recvmsg_parser=
()
> functions, to ensure that they are properly handling spurious wakeups in
> tcp_msg_wait_data().
>
> The expected behaviour is that recvfrom() does not return an EAGAIN
> error.  If the spurious wakeups are incorrectly handled, this assertion
> will fail.
>
> Signed-off-by: Nnamdi Onyeyiri <nnamdio@gmail.com>

The test looks fine, even if slightly flaky. Running with only patch 2/2
still passes sometimes on my box. Can we handle this somehow, e.g., do
more attempts?

There's also a couple magic numbers in the tests that may need some
explanation (noted below).

> ---
>  .../selftests/bpf/prog_tests/sockmap_basic.c  | 124 ++++++++++++++++++
>  1 file changed, 124 insertions(+)
>
> diff --git a/tools/testing/selftests/bpf/prog_tests/sockmap_basic.c b/too=
ls/testing/selftests/bpf/prog_tests/sockmap_basic.c
> index cb3229711f93..d18faf46fac0 100644
> --- a/tools/testing/selftests/bpf/prog_tests/sockmap_basic.c
> +++ b/tools/testing/selftests/bpf/prog_tests/sockmap_basic.c
> @@ -1373,6 +1373,126 @@ static void test_sockmap_multi_channels(int sotyp=
e)
>  	test_sockmap_pass_prog__destroy(skel);
>  }
> =20
> +static void *test_sockmap_recvfrom_eagain_thread(void *arg)
> +{
> +	int fd =3D *(int *)arg;
> +	char buf[1024];
> +	void *result =3D NULL;
> +
> +	while (true) {
> +		ssize_t len =3D recvfrom(fd, buf, sizeof(buf), 0, NULL, NULL);
> +
> +		if (len =3D=3D -1) {
> +			if (errno =3D=3D EINTR)
> +				continue;
> +			result =3D (void *)1;
> +			break;
> +		}
> +
> +		if (!len || buf[len - 1] =3D=3D 'e')
> +			break;
> +	}
> +
> +	send(fd, "test", 4, MSG_NOSIGNAL);
> +
> +	close(fd);
> +
> +	return result;
> +}
> +
> +static void test_sockmap_recvfrom_eagain(bool with_verdict)
> +{
> +	struct test_sockmap_pass_prog *skel =3D NULL;
> +	struct bpf_program *prog =3D NULL;
> +	size_t buflen =3D 1024 * 1024 * 25;

Here

> +	char *buf =3D NULL;
> +	int map, err;
> +
> +	skel =3D test_sockmap_pass_prog__open_and_load();
> +	if (!ASSERT_OK_PTR(skel, "open_and_load"))
> +		return;
> +
> +	map =3D bpf_map__fd(skel->maps.sock_map_msg);
> +
> +	if (with_verdict) {
> +		prog =3D skel->progs.prog_skb_verdict;
> +		err =3D bpf_prog_attach(bpf_program__fd(prog), map, BPF_SK_SKB_STREAM_=
VERDICT, 0);
> +		if (!ASSERT_OK(err, "bpf_prog_attach verdict"))
> +			goto cleanup;
> +	}
> +
> +	buf =3D malloc(buflen);
> +	if (!ASSERT_OK_PTR(buf, "malloc buf"))
> +		goto cleanup;
> +	memset(buf, 0, buflen);
> +	buf[buflen - 1] =3D 'e';
> +
> +	for (int i =3D 0; i < 200; ++i) {

Also here. Why 200 iterations specifically? Can we at least name the
defaults to make it clearer that we've chosen those numbers because
that's how we trigger the bug?

> +		ssize_t sent;
> +		char ignored[128];
> +		pthread_t thread;
> +		bool thread_created =3D false;
> +		size_t rem =3D buflen;
> +		int c =3D -1, p =3D -1, zero =3D 0;
> +		bool success =3D false;
> +
> +		err =3D create_pair(AF_INET, SOCK_STREAM, &c, &p);
> +		if (!ASSERT_OK(err, "create_pair"))
> +			goto end_attempt;
> +
> +		err =3D pthread_create(&thread, NULL, &test_sockmap_recvfrom_eagain_th=
read, &p);
> +		if (!ASSERT_OK(err, "pthread_create"))
> +			goto end_attempt;
> +		thread_created =3D true;
> +
> +		err =3D bpf_map_update_elem(map, &zero, &c, BPF_ANY);
> +		if (!ASSERT_OK(err, "bpf_map_update_elem"))
> +			goto end_attempt;
> +
> +		while (rem) {
> +			sent =3D xsend(c, buf + (buflen - rem), rem, 0);
> +			if (sent =3D=3D -1)
> +				goto end_attempt;
> +			rem -=3D sent;
> +		}
> +
> +		/* we cannot use recv_timeout(), otherwise EAGAIN would be an expected=
 errno. */
> +		err =3D recvfrom(c, ignored, sizeof(ignored), 0, NULL, NULL);
> +
> +		/*
> +		 * we are checking for the invalid return of EAGAIN, any other return =
is considered
> +		 * successful for the purposes of this test.
> +		 */
> +		if (err < 0 && !ASSERT_NEQ(errno, EAGAIN, "recvfrom eagain"))
> +			goto end_attempt;
> +
> +		success =3D true;
> +
> +end_attempt:
> +		if (c >=3D 0)
> +			close(c);
> +
> +		if (thread_created) {
> +			void *retval =3D NULL;
> +
> +			pthread_join(thread, &retval);
> +			if (!ASSERT_NULL(retval, "retval"))
> +				success =3D false;
> +		}
> +
> +		if (!thread_created && p >=3D 0)
> +			close(p);
> +		if (!success)
> +			break;
> +	}
> +
> +cleanup:
> +	if (buf)
> +		free(buf);
> +
> +	test_sockmap_pass_prog__destroy(skel);
> +}
> +
>  void test_sockmap_basic(void)
>  {
>  	if (test__start_subtest("sockmap create_update_free"))
> @@ -1451,4 +1571,8 @@ void test_sockmap_basic(void)
>  		test_sockmap_multi_channels(SOCK_STREAM);
>  	if (test__start_subtest("sockmap udp multi channels"))
>  		test_sockmap_multi_channels(SOCK_DGRAM);
> +	if (test__start_subtest("sockmap recvfrom eagain"))
> +		test_sockmap_recvfrom_eagain(false);
> +	if (test__start_subtest("sockmap recvfrom eagain with verdict"))
> +		test_sockmap_recvfrom_eagain(true);
>  }

