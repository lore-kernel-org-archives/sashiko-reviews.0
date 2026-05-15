Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5847F37DAA6
	for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 20:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778875789; cv=none; b=fbqcJTuLyRqDWg1HkTmSIDuHW6I2z6OgnRHZpDezEurl6veOnWQ7R+Uy4vWOD4zmSL5sA1abUSfglLE7+aEo0Sa/ZUGRAYrR2bH6TWf8gLKwRKLxY9tymhGW6ZLTv/elsYB17VmVmcWZl2m/3blAjSAX4a7tViRyvPKY69k26lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778875789; c=relaxed/simple;
	bh=eHYdQTeQyDvfFdCM0KGLCYSBT9jr3H9LQqqjbauCO+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dpum2biCijz5x/UzWrzlVMi3BP72diS3IuATaP5XhKOIp9dS+KOKxtpA/xCbQZkgpqBfLNfzKSChxOBwsHnom7yWMOmVbhBw5oGpeFwaYbNLMEG3sEEwbnurjcM/AJ++j0Zpq+egyzaeoPZ5NiLDrc44300rF22/w5Tfx3sF/v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LquQbzXW; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LquQbzXW"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so1311745e9.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 13:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778875786; x=1779480586; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+S5wVxWfcKMGbz7T+itvslblDRSu63n1AJM/TQSrJjM=;
        b=LquQbzXWbu/U7H0Sq98zIHGGOZWOgUS9CO9UZqC9pVTLt9U10IM04OmC9u+SYtK+Bs
         +0bzulF1cX1Bs6o34yczBQZcKn5qZwf1aIomKQsc/tiCJjGyZk11JbHj29elv/IF/X68
         sfDQONSPdrEoUpi+HXlzWPYUTEwdUxpHRjLiKXZRnRNXLU+GCv2kz6UviwSRpFHZRvSP
         h4aVscfa/nxmKJYXKdr/qjSRfx0zD9sd9d/VGdJ6+MBnPq8ZbLqRRiUfZeZ5Et/BTT9X
         KyLstb/KwZy0cq5Echt6fxBL07MFA8pCJz4ZjKBfAoAJYNfh9ZdIjIyne1ferhbuM7Q1
         bImg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778875786; x=1779480586;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+S5wVxWfcKMGbz7T+itvslblDRSu63n1AJM/TQSrJjM=;
        b=P0DFkyzKjH46eJvQENvgHw536b6u0gbMKj0FnNvxMfsQMmuB5sac448QJ6vOnTHrpH
         s/dwAlC53U5gY5ckb/F7/G9NBDexL/V9tBHO4RxEb8e7Zpo246Y4S9kGpQTiLAzNpWjW
         JILmpOuQrW1TIEFcS0LY7X8Mmxkv5UO4bDA1lr0Yz82YWRmSk+FB0zQk1m4MQM05z88r
         itT+MfqzlZGWnwjxMYBk6u3mCkhm1ROzLQkwpe0urMBxCYMtd5HMIFD+1EMD8c50rfVL
         PRU4lfBRgsx48oZuqdqnXJmQpBwhTcQoboYDQ9khJVw8zH9HME12bDmB973ikjbhjtlX
         M8ag==
X-Gm-Message-State: AOJu0Yx52qDiRkz2XNDpz3grpYagwTjY2Lf8KwFnKA/a+e9eSqBAyUCD
	tcwozQqgHggsNhKbt1mgKyl0SOVot/w+tsFL3GK06K1drP+7KtuCz5Z7+iIutZ0n
X-Gm-Gg: Acq92OFoTUeXqJLn0R0Pad5Evf2pIICsmWE3WOKsz9m9T1kBSM671D5W2ZYCkktD2ps
	INfdq6nVCIALDLLqPrqpe280zaWr9tHTnTcYfzjV8YuPJI/G78/CPCcP/sVPdWnHzF5GaZy8Dph
	U5B3s8XddvA060/FVUG8E4WNo7CLAtQIcTmkHTOm7NcfQy/yLDPCd0g43c0mIn6h92d2c2VtYHR
	IaIf65AzCRQQsXAHLWh0IoVyVwhiz5qznpNJ6etyilFRcu+Ig21EXsOvPnyyfn9rEN4ksrOBqq6
	VOg0ThWG/L6qyEoeBI2ZjoAR7fy9F5kRjEVBNvJeO8ptk2v05Y/TMda7kotyI4AWAmF3HTkjls8
	J+R/yynTxWnDi9WD8ahUMwoxcz9lMp4/m/EShvvAu/RhwxnoKhKbfhmyeuC2YXC552f0QD/rbrT
	UMP9TZx96JFKn2tkTsfpq/SOEYgjqaHlV8v7S7sUHMT74riSFMnr1f/gThKyjZ1OWLTWSIm9ad+
	w8z2OoSsQs=
X-Received: by 2002:a05:600c:34d4:b0:48f:e230:c3fa with SMTP id 5b1f17b1804b1-48fe6626a58mr75827145e9.32.1778875785529;
        Fri, 15 May 2026 13:09:45 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd1f:f500:f867:fc8a:5174:5755? ([2a01:4b00:bd1f:f500:f867:fc8a:5174:5755])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5694fbfsm149747125e9.6.2026.05.15.13.09.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 13:09:45 -0700 (PDT)
Message-ID: <8b2d626f-9fe2-47fc-830d-a26183913d77@gmail.com>
Date: Fri, 15 May 2026 21:09:44 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 3/3] selftests/bpf: Add test for tracepoint
 btf_ids tracefs file
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260515-generic_tracepoint-v1-3-aa619fa94132@meta.com>
 <20260515183659.31941C2BCB0@smtp.kernel.org>
Content-Language: en-US
From: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
In-Reply-To: <20260515183659.31941C2BCB0@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/15/26 7:36 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] Missing test environment check for `bpf_testmod` module causes spurious test failures.
> - [Medium] Out-of-bounds array reads and cascading failures due to non-aborting assertions and missing length checks.
> --
> 
> commit 1c2fbe8e9b6c6c1082b4ae630c67ceb3b5db79b5
> Author: Mykyta Yatsenko <yatsenko@meta.com>
> 
> selftests/bpf: Add test for tracepoint btf_ids tracefs file
> 
> This commit adds a selftest to verify that the BTF IDs exposed in the
> tracefs btf_ids file for a module tracepoint match the expected FUNC_PROTO
> and STRUCT representations. It uses the bpf_testmod_test_read tracepoint
> to exercise the module/split-BTF path.
> 
>> diff --git a/tools/testing/selftests/bpf/prog_tests/tp_btf_ids.c b/tools/testing/selftests/bpf/prog_tests/tp_btf_ids.c
>> new file mode 100644
>> --- /dev/null
>> +++ b/tools/testing/selftests/bpf/prog_tests/tp_btf_ids.c
> 
> [ ... ]
> 
>> +void test_tp_btf_ids(void)
>> +{
>> +	const struct btf_type *proto_t, *rec_t;
>> +	const struct btf_param *params;
>> +	const struct btf_member *members;
>> +	struct btf_ids_info info;
>> +	struct btf *vmlinux_btf, *btf;
>> +	const char *name;
>> +	int err;
>> +
> 
> Since this test relies on bpf_testmod_test_read from the bpf_testmod.ko
> kernel module, should there be a check for env.has_testmod here? 
> 

yes

> Without it, if the module is not loaded, the test might fail with a missing
> tracefs directory instead of gracefully skipping via test__skip().
> 
>> +	err = read_btf_ids(&info);
>> +	if (!ASSERT_OK(err, "read btf_ids"))
>> +		return;
> 
> [ ... ]
> 
>> +	/*
>> +	 * raw_btf_id should be the FUNC_PROTO of __bpf_trace_<call>:
>> +	 *   void *__data, struct task_struct *task,
>> +	 *   struct bpf_testmod_test_read_ctx *ctx
>> +	 */
>> +	proto_t = btf__type_by_id(btf, info.raw_id);
>> +	if (!ASSERT_OK_PTR(proto_t, "raw type_by_id"))
>> +		goto out;
>> +	if (!ASSERT_TRUE(btf_is_func_proto(proto_t), "raw is FUNC_PROTO"))
>> +		goto out;
>> +	ASSERT_EQ(btf_vlen(proto_t), 3, "func_proto arg count");
>> +
>> +	params = btf_params(proto_t);
>> +	ASSERT_STREQ(param_name(btf, &params[0]), "__data", "arg0 name");
>> +	ASSERT_STREQ(param_name(btf, &params[1]), "task", "arg1 name");
>> +	ASSERT_STREQ(param_name(btf, &params[2]), "ctx", "arg2 name");
> 
> Does this code risk reading out of bounds if btf_vlen(proto_t) is less than 3?
> 
> The ASSERT_EQ macro logs a failure but does not inherently abort the
> function execution. Should this be wrapped in a conditional check, such as
> if (!ASSERT_EQ(...)) goto out, to prevent accessing params[2] if the length
> is too small?
> 

ok, I'll apply all these in v2

>> +
>> +	/*
>> +	 * tp_btf_id should be STRUCT trace_event_raw_<call> with the
>> +	 * fields declared by TP_STRUCT__entry plus the common header.
>> +	 */
>> +	rec_t = btf__type_by_id(btf, info.tp_id);
>> +	if (!ASSERT_OK_PTR(rec_t, "tp type_by_id"))
>> +		goto out;
>> +	if (!ASSERT_TRUE(btf_is_struct(rec_t), "tp is STRUCT"))
>> +		goto out;
>> +	name = btf__name_by_offset(btf, rec_t->name_off);
>> +	ASSERT_STREQ(name, "trace_event_raw_bpf_testmod_test_read",
>> +		     "tp struct name");
>> +
>> +	members = btf_members(rec_t);
>> +	ASSERT_STREQ(member_name(btf, &members[0]), "ent", "field0 name");
>> +	ASSERT_STREQ(member_name(btf, &members[1]), "pid", "field1 name");
>> +	ASSERT_STREQ(member_name(btf, &members[2]), "comm", "field2 name");
>> +	ASSERT_STREQ(member_name(btf, &members[3]), "off", "field3 name");
>> +	ASSERT_STREQ(member_name(btf, &members[4]), "len", "field4 name");
> 
> Similarly, is it necessary to assert btf_vlen(rec_t) and conditionally jump
> to out if it is too small before accessing members[0] through members[4]?
> 
> If the structure layout changes or is malformed, this might read adjacent
> BTF data.
> 
>> +out:
>> +	btf__free(btf);
>> +	btf__free(vmlinux_btf);
>> +}
> 

