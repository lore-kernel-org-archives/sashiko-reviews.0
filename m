Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793671307;
	b=24oWC295UuQ3VYjJXI+9jqilPP8ebAYsBrZplCvwGvClUJn3BwUMOJUvRP3w0x9cK26j
	 zfT9WNFjbWWwovTea9VFSvzOl8MOIJI9T97yrYLuUhWLhSjB3LL35gXMigqxmGaHyJvUd
	 aw38NieyBM9HFrs22uQ5i4NWlpgvGS6J6Tv+CH9BoJpGCmoOTpkZR2RXp5z0TPc9VNA6w
	 Do8gK1rdvqLiU827GD1RiVG23SLd6EM7QTuasHs8EoEGHeeBxCjvx4A7wC4WhwURPxfYu
	 /WMdNZioA0Q1uqkY48+OLXJqgPnb8Wjjd2TQPnDHXh7p+rCzUk2tvrEjIyHwsT07AmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793671307;
	h=DMARC-Filter:Received:Received:Subject:To:Cc:References:From:
	 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Language:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=R+R/zoUatofm4R0LIX34DtFmZRn+sOpXy2WFmyfKi6Q=;
	b=NXXKor1LqE3Jhj+NJXSiDrQaO8rEe7njXmkTAfYKQl7dIfAj2Mv5VcCJFMgtHO8YblHp
	 9RrieD6AA71utVElhjWSqlKXivpLD713ZNJDIm08wQ5JmozeGzd7ryeR9HiCh+246LSiB
	 zz2pQjovalh15JLdacZgs1GPHd+cB/DuE+T7nx/ToSluafK25HRJNqy1dysw07RMiTL+/
	 6mqHI9R6eAA6kA5sZ0Wj61fA5hG3JUoxWXVAkJEBMd8fmc4NRcrwViuuuYoYG796ATb9r
	 bIHxHbc0QPzWQQ2rSTBauYbQZVe5VsyO+nuorysKVOTY1biMbeTTQwJ92I9KUAQ/S5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31640606A326
	for <sashiko-reviews@lists.linux.dev>; Tue,  3 Nov 2026 02:01:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31640606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8CxfdKGQOlq1s0bAA--.14979S3;
	Tue, 03 Nov 2026 10:01:42 +0800 (CST)
Received: from [127.0.0.1] (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJDxBc2FQOlqXwoyAA--.9896S2;
	Tue, 03 Nov 2026 10:01:42 +0800 (CST)
Subject: Re: [PATCH bpf-next v1 1/2] selftests/bpf: Handle EOPNOTSUPP
 gracefully in test_loader
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20261102081230.7063-1-yangtiezhu@loongson.cn>
 <20261102081230.7063-2-yangtiezhu@loongson.cn>
 <sashiko-outbox-193107@kernel.org>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <eb86e8a0-acae-6240-0c82-98ce1c8a0a4e@loongson.cn>
Date: Tue, 3 Nov 2026 10:01:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <sashiko-outbox-193107@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxBc2FQOlqXwoyAA--.9896S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7KFWrCw1DGF1DuF13Zr17CFX_yoW8WF1kpa
	4kX3s0yFySqF1Sq3srurW7XrWjgF4UuF98Cr1rtw1fZr17Xr4aqr1xKa15trnxWrWxZwn0
	v34Ikrn3G3y8AFgCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07UiVysU
	UUUU=

On 2026/11/2 下午4:28, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] selftests/bpf: indiscriminate EOPNOTSUPP skip in run_subtest()

...

> Would it be better to explicitly probe for BPF_MAP_TYPE_ARENA support
> (similar to libbpf_probe_bpf_map_type(BPF_MAP_TYPE_ARENA, NULL) in
> test_verifier_hmul_arena() in
> tools/testing/selftests/bpf/prog_tests/verifier_hmul_arena.c) or handle
> unsupported map creation specifically, rather than catching all EOPNOTSUPP
> errors from bpf_object__load()?

Will use libbpf_probe_bpf_map_type() in prog_tests instead of
handling EOPNOTSUPP globally in test_loader.

Something like this:

```
diff --git a/tools/testing/selftests/bpf/prog_tests/jit_insns.c 
b/tools/testing/selftests/bpf/prog_tests/jit_insns.c
index 52bffe27199b..9c4cbf6807ae 100644
--- a/tools/testing/selftests/bpf/prog_tests/jit_insns.c
+++ b/tools/testing/selftests/bpf/prog_tests/jit_insns.c
@@ -3105,7 +3105,14 @@ static void test_helper_calls(void)

  void test_jit_insns(void)
  {
-	RUN_TESTS(jit_insns_arena);
+	if (libbpf_probe_bpf_map_type(BPF_MAP_TYPE_ARENA, NULL)) {
+		RUN_TESTS(jit_insns_arena);
+	} else {
+		if (test__start_subtest("arena_zero_off"))
+			test__skip();
+		if (test__start_subtest("cast_to_user"))
+			test__skip();
+	}
  	if (test__start_subtest("alu_imm"))
  		test_alu_imm();
  	if (test__start_subtest("alu_reg"))
```

I will send out v2 next week if no more comments.

Thanks,
Tiezhu

