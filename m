Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795097022;
	b=xz8+n9z9GZSj7Ee+QHDH1kIwWPq8g8Kgyxq0KMptoe7vEs7nXajVqkVlbUXcmUV/rvAo
	 mWFsu4l+DwOVYj6d86AQLJubFTLAzpDmfiKvxHUntCfhxja7RyV2r0AT1XPYratQqQozu
	 /yhcr4bxWdQjEP2wYS5a6BEfoi6+0yD7HLpBw9hFb6ePicB+Zv6xfAo7J9vpz+HHi5n5r
	 td6GwHtQw0HcbVMVDdldO731MQwfJAR+JiVxHZiLeIZoEMwhTMIWcYAAaPgmH6vZx+aqr
	 m3gLf+OZQir9FM+Q5xt1IdcjLd8r5yXlwEfoxgCGQdpCCbMxMagnLFxBLCVbRfEz9yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097022;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=e11EI5HUYH38rhtF9FVzG/dbODjC6Dq9r2AF5SdURro=;
	b=HoGFl667/eFXPU0erlwe67chs8Cd5jU9uIFv5Zsg3zHy7ht93DreOEByLPyPYP/fEd4A
	 mgWZ0uAUICoro/ypevXWHWK8RRREuktxNU477CnPJq/JV8maEUPKIy5gqNXmxC1PeXHzv
	 +cHHwekRxMIV+5p4QqErVqHVcHCnhfNg+VKgcJEDbAywl8/mHMDk2AoGGdbwBgvs5Ho+R
	 C+bks5k4FbQj3pLQi+grlRRcWXKnsvg+7jkxSKeW1bqH88327xXwjG76L9lJUyv+4QcT8
	 fmoFVNHxCAU3SpTa2KhXYIaBmZUVTZfT2LfN0NYRViXDXSi61/yVGlp/zr3ZBudy38Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PwJkoISq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9620606A324
	for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 14:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PwJkoISq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF91D1F000C7;
	Thu, 19 Nov 2026 14:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795097022;
	bh=e11EI5HUYH38rhtF9FVzG/dbODjC6Dq9r2AF5SdURro=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=PwJkoISqT6EaC0sZkStTcJo45598OYDzHwp9gfFfqn9uRoAG1Yg4ahZTMuCTvhb7a
	 14xpOeQZfd6YjLY9BVIczZzlXE9E7iIjJ3NsbVI0JOCkkY2tz/Kr7ecx3vErx5PQ9+
	 CL+ZHICinTASfBwd1uhi3TphOs+mOPSsdnkPhLkipU55Ki2z3KmRWnxAEFQVYI8LBx
	 CfYsgHLyAFiKETxHqOQUHqHz5f56AITZz3hiwpoHVUc77y0JFugaO+JAz0TX8HXHzG
	 zCS2QcYsh0tewRa27ni4OzTZQV8L7u9+mocxYaVVuSb0sKTgVdW7047pTiAAPPHHFK
	 Y+k9Mo1jgYSMA==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 0FEA4198004A;
	Thu, 19 Nov 2026 09:03:40 -0500 (EST)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Thu, 19 Nov 2026 09:03:40 -0500
X-ME-Sender: <xms:ugH_ahf63RW6MbgcteVZgf9zd4Dci0kGEjOq79aATfIYmJ6x9SrE8g>
    <xme:ugH_aqD59hiZYEATE3c8N1CySI58yXhWSdVg_WffAM-NXwZe9bsogkiYPeShZAfHf
    sppKaRxDaq8-VvSFC6mkmO518vV1WiFjPFZjz-9saO6gUP7qIHtJc_B>
X-ME-Proxy-Cause: dmFkZTFZ0/opS/OEdL6TyesgIFYBhyhms6dCId0BZNRlqxIsUc3/R9O1/SEa6wmz3oCDH2
    WHtrVqtIHQRw8n9z7z+CTC/COuUus2sD5ZoLmedmzD4SAGjrhTCD3lmSf5AG9U63xhcFrS
    dyyfPn0Cv5J/7DJexKVDN1qPCE34iUtEVxkcORtHRah84RHeVWuWEleKmFwzh3smpaUTGm
    Li4RfqZVLFlY3rb8OqBLNK8aRzrhSf6AVUR6SYhRMX7Jak0lBTARwL1oRDY4B4/k+9mzHk
    SSfEuUtdN2sVOw2hbhBcwg8uzkTgrE/d/aFBwqHQ010cHeKSYsMwdrlEt7RleB3jZILjj2
    CCooShuiwY6mfuCFWy1K/iIgMBnIP3/b0evwKsMbHPIKGPkZUzYGeeYKM/tIIN0ywJ/MuW
    MumLGaooVbYsQe98lttPjNGhglEGAUbmgKFeFk7/ydi2QdcP9IH5mDbl7/zQUzeasjP5A1
    6eAn1uyYgMstlzu/QvFgozOuvW/CyDJ2pxNZ1Skwtt3MXGJPCPzXHn7/qH+SJ0JQTzvmFw
    z0QWHh3TI0Fc74e9F+az/LtEGTJDBYjLsG3IxW/od+hBLmeXlsuy0CpBjC3yOQcjeow216
    UgJjPbKH5qwrr1SIdMKzzYuGL9x4ZDT4Kx+r97Y3umcvbRG5+HHm+FZKugsg
X-ME-Proxy: <xmx:vAH_ajJyxbbeTJSNijbLLjqsFJ7DlCLzv6mvdc5i3YogxIlGCnpGeA>
    <xmx:vAH_agf7r7zZTDaa6Z9CXr9MCCdAlcoAOkQ3PgZ_66ajmTZAXvTZ-A>
    <xmx:vAH_ai_7X1VcFlxZMQcXPSx-iUM_STg6zaNmhx2ghNFnIzAzPBqIxg>
    <xmx:vAH_atpLDnal8svyG675XQOCWQmwUeGeeOIiz5uT87rzY6TXGS7Qtw>
    <xmx:vAH_anCePCP23IvZSwRq8Ot258hoeSODfjmYOChNPQNf7xI9lYddHe2h>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 6D439F8008E; Thu, 19 Nov 2026 09:03:38 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Date: Thu, 19 Nov 2026 15:03:17 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: sashiko-reviews@lists.linux.dev, "Ard Biesheuvel" <ardb+git@google.com>,
 linux-mm@kvack.org
Cc: "Suren Baghdasaryan" <surenb@google.com>,
 "Kent Overstreet" <kent.overstreet@linux.dev>, "Hao Ge" <hao.ge@linux.dev>
Message-Id: <b7521ecf-d30a-4b47-959e-43257baaf8a9@app.fastmail.com>
In-Reply-To: <sashiko-outbox-223175@kernel.org>
References: <20261118132719.632451-2-ardb+git@google.com>
 <sashiko-outbox-223175@kernel.org>
Subject: Re: [PATCH] alloc_tag: Use __ prefixed ELF section names
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Thu, 19 Nov 2026, at 14:27, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] alloc_tag: SECTION_START() and SECTION_STOP() fail to expand
>   macro argument
> - [Low] alloc_tag: missing Fixes: trailer for unprefixed alloc_tags
>   section name
> --
>
> commit 933587991e6a16ab600445b22347397f80335de9
> Author: Ard Biesheuvel <ardb@kernel.org>
>
>> alloc_tag: Use __ prefixed ELF section names
>>
>> The compiler will emit static relocations related to a section .foo into
>> a separate section called .rela.foo, i.e., it just appends the section
>> name to the string ".rela"
>>
>> When section names start with . or __, this results in relocation
>> section names that are correctly matched by the various pattern rules in
>> the various linker scripts across the tree.
>>
>> Without any such leading delimiter, it may lead to spurious warnings
>> such as
>>
>>   >> ld: warning: orphan section `.relaalloc_tags' from `init/main.o' being placed in section `.rela.dyn'
>>      ld: warning: dot moved backwards before `.rela.dyn'
>>      ld: .tmp_vmlinux1: section `.rela.dyn' can't be allocated in segment 1
>>
>> Fix this by renaming the section to __alloc_tags. While at it, tweak the
>> headers so that the definition of the name appears only a single time.
>>
>> Cc: Suren Baghdasaryan <surenb@google.com>
>> Cc: Kent Overstreet <kent.overstreet@linux.dev>
>> Cc: Hao Ge <hao.ge@linux.dev>
>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>
...
> Does #NAME in SECTION_START() and SECTION_STOP() stringify the macro name
> "ALLOC_TAG_SECTION_NAME" instead of expanding it to "__alloc_tags"?
>
> In alloc_tag_sec_init(), kallsyms_lookup_name() will look up
> "__start_ALLOC_TAG_SECTION_NAME" and "__stop_ALLOC_TAG_SECTION_NAME"
> instead of "__start___alloc_tags" and "__stop___alloc_tags", returning 0
> for both.  When compressed page allocation profiling is enabled
> (sysctl.vm.mem_profiling=1,compressed), kernel_tags.count remains 0,
> causing idx_to_ref() and ref_to_idx() to misclassify built-in kernel tags
> as module tags and dereference an invalid module_tags.first_tag pointer on
> page allocation or free.
>
> Using __stringify(NAME) instead of #NAME would expand the argument first.
>

Ugh the token pasting stuff always confuses me - I'll fold this in for v2.

