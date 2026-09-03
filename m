Received: from mta0.migadu.com (out-111.mta0.migadu.com [91.218.175.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF804B146D
	for <sashiko-reviews@lists.linux.dev>; Thu,  3 Sep 2026 13:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788443712; cv=none; b=Ydo5UiRi0sXWbJ/LnCmcxucEO2qyE6TcnUR3+X5JOSc4QJWIV+PjQ5A5pq9jWVolOGED67UHMvzAi8wgexxsg6AQo+VKY9iPpVEpRQS84MbLlQWjjyDl1ace2lE/bbYU9NUqEdnS+o7wcv21IoBH3wNKYMtUJjQrvgY9sPpffDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788443712; c=relaxed/simple;
	bh=QIqbvz4x04B7tLCAr2+Lzccoe0qRuhSH3DR+RGVqY3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T0v+7mW5emWa6xGOL7RGx576iChs31SFOyD0BL3dDkzcTV19DHNFfRkRJUiAwvFCLcLMhvW2P0BZewlE57utgGAMkUnt6L+OmdOTtiZdcUrrk84X/RHTtzEjaNsdjEwVySm5m7dMHhcXsYcDbTI9eLygMAwdGEzLYZVdRyTfK6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pI26r2r8; arc=none smtp.client-ip=91.218.175.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pI26r2r8"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=QIqbvz4x04B7tLCAr2+Lzccoe0qRuhSH3DR+RGVqY3A=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788443688; v=1; x=1789048488;
 b=pI26r2r8ep5C2Z+wrH93WH3yM3B3t86Es2UkS0lHja3TfvhryC08cXZikU8+wZeurmlmbKzG
 sa4tGlftW+8SiiqRv1cPd1xZOrtB9ic+YtmsswAQItthoScugwUKlOpYuA4N8WpPkuhSPdz79fC
 PxJTTZMKZHS8Lwe5rbz8vJrA=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 144b814a11d73f13;
	Thu, 03 Sep 2026 13:54:48 +0000
X-Mizu-Trace-ID: 144b814a11d73f13
X-Migadu-Flow: FLOW_OUT
Message-ID: <f8ce3382-42aa-44b0-a6b0-a77950a3f941@linux.dev>
Date: Thu, 3 Sep 2026 21:54:44 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf 2/2] selftests/bpf: Test bpf_sock_destroy() on a
 TIME_WAIT sock
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260903125306.299943-1-jiayuan.chen@linux.dev>
 <20260903125306.299943-2-jiayuan.chen@linux.dev>
 <20260903130732.B475B1F00AC4@smtp.kernel.org>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <20260903130732.B475B1F00AC4@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 9/3/26 9:07 PM, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] The test creates a simultaneous close race condition that will cause it to randomly fail by observing the socket in TCP_CLOSING state instead of TCP_TIME_WAIT.
> - [Low] The multi-line comment uses the incorrect style for the BPF subsystem.
> --
>
> commit c91152edb079a3ce44e0f45e8d080efb432c5870
> Author: Jiayuan Chen <jiayuan.chen@linux.dev>
> Date:   Thu Sep 3 12:52:49 2026 +0000
>
> selftests/bpf: Test bpf_sock_destroy() on a TIME_WAIT sock
>
> This commit adds a tcp_timewait subtest to verify that bpf_sock_destroy()
> correctly handles TIME_WAIT sockets. A tcp iterator finds the timewait
> socket by its inherited cookie and destroys it.
>
>> diff --git a/tools/testing/selftests/bpf/prog_tests/sock_destroy.c b/tools/testing/selftests/bpf/prog_tests/sock_destroy.c
>> index 9c11938fe597d..6ccc7cda410bf 100644
>> --- a/tools/testing/selftests/bpf/prog_tests/sock_destroy.c
>> +++ b/tools/testing/selftests/bpf/prog_tests/sock_destroy.c
> [ ... ]
>> @@ -110,6 +110,65 @@ static void test_tcp_server(struct sock_destroy_prog *skel)
> [ ... ]
>> +	/* Active close from the client, then close the server side. Once
>> +	 * recv() sees EOF the server FIN has been processed and the client
>> +	 * sock is in TIME_WAIT. Block without timeout so a loaded CI box
>> +	 * can't race us.
>> +	 */
> [Severity: Low]
> Does this multi-line comment follow the BPF subsystem coding style? The
> guidelines prefer placing the opening /* on its own line before starting
> the comment text.
>
>> +	if (!ASSERT_OK(setsockopt(clien, SOL_SOCKET, SO_RCVTIMEO, &tv,
>> +				  sizeof(tv)), "clear rcvtimeo"))
>> +		goto cleanup;
>> +	if (!ASSERT_OK(shutdown(clien, SHUT_WR), "client shutdown"))
>> +		goto cleanup;
>> +
>> +	close(accept_serv);
>> +	accept_serv = -1;
>> +
>> +	/* block until return EOF */
>> +	n = recv(clien, buf, sizeof(buf), 0);
> [Severity: Medium]
> Could this sequence create a simultaneous close race condition that leads to
> random test failures?
>
> If shutdown(clien, SHUT_WR) sends a FIN, and the test immediately calls
> close(accept_serv) on the server without waiting for the client's FIN to be
> processed, the server might send its FIN before receiving the client's FIN.
>
> If these FINs cross (simultaneous close), the client will receive the
> server's FIN, enter the TCP_CLOSING state, and wake up the blocking recv()
> call. The subsequent BPF iterator would then run while the socket is still
> in TCP_CLOSING rather than TCP_TIME_WAIT.
>
> Because the socket is in TCP_CLOSING, bpf_skc_to_tcp_timewait_sock() will
> return NULL, causing the iterator to miss the socket and the assertion
> ASSERT_EQ(skel->bss->tw_found, 1) to fail.


Right, I think I can just recv(accept_serv) to make sure client's FIN

has been processed by server before closing it, so the two FINs won't
cross
