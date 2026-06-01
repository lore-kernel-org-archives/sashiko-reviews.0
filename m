Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C55282F14
	for <sashiko-reviews@lists.linux.dev>; Mon,  1 Jun 2026 17:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780334534; cv=none; b=U0UR0WD68JD4zaQV1sRGZxLp7PjNwIQHdjB4KvZB7mAdpVFOQhuIUvgO4OvumiiH9IyqPdxjsSAEwMBk9D654qyFtqo1ucGpATLeEg1lCenJMzRIbLE3ZSRhgleVOJtv4Z4wkRRkuciOoUwwP4FJq2xRsqntmS6XUTVhNXxW6l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780334534; c=relaxed/simple;
	bh=kc8EIZaWxlOaP0fjIao/AaEk2YM8tok83Z2MCda/nis=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=jlm/frhQYRBeWjb7R7l9/ACy013NWQtIqrtdlOcIIMehUfLMjP/RTdgOO1tNLkVrSaHYfjLHsCujzjE0sBbcUqGgtm/WTytUTOqiz9IE+42r53A7EmpgleFd0tN6ZlPNLYUTTAlhHkHoLKehigXGgaBuMPxZZPARhoj7fpoh6RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=GfL42T5k; arc=none smtp.client-ip=74.125.82.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="GfL42T5k"
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-137dd523634so2344822c88.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 01 Jun 2026 10:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1780334532; x=1780939332; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VbHw1s/hzOM7Hz5hE1SgdFXgocGRCLxeL+0RQCPiwMg=;
        b=GfL42T5k8YkbVeaL7f11uBrYLiK9mR/vPTw9zVdJ7ck9fVjo+/Lldf2acQLVg7YafE
         Z7CBcGscXTVhzrnV5SuYXfl9bo9NFrfkTwrjd4sVZihjoSmfOtnarFdoXlRh5cAt+c6u
         pU1E6mSnCtqcv/mdU1rJPOmsUje1wCk0iAf2jE9wVKuor2C9HK3ZMugaAp+PvSJAtQUJ
         Ev+BlqrOQ94E94h9SaC4a+VvVL/1mtFD8JGXYs1QmKf5q2mfeRQFWXh87uizCFq3sJoG
         +vqJZ+rIBG7U7+EknfoHEX7J1mG1s05NCcf7XXrL4Rn6DJH/wrZyeZoNzN4hor9skL4v
         P62g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780334532; x=1780939332;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VbHw1s/hzOM7Hz5hE1SgdFXgocGRCLxeL+0RQCPiwMg=;
        b=RuhY2+tAlUwoPipFZtoYBP6+4tKAeThWqde8CZ3E9qIyM8XjD4b/r8MM0Ygw6Vd6C9
         mALksWkwExo9KixDqh3dFkiy21K02FbGxmq/+S6lXTqAXie7CEz3Y93kz9BVgeI6kVpX
         L/g9kF0Wp4AVAem5IM3AWhwg7zOZ+8YGi5IxVsqje9GcQS0J75R8P8qScOejy/fmmUR3
         xXKRVsZmmrTEFLOlHOkfu3lvRoe204zNcPDfflcIwQQ243dOOeqORqi33Clwyz2heuzt
         KDz0vYTen+2FoyAsBeoSt6zDn8fexbXrvUxQBVjHW7vGkkfA1ivE3s75OvV1myjiXHWE
         KNiQ==
X-Forwarded-Encrypted: i=1; AFNElJ9gE1g6FWCZ1KsKEfnnJEe066hcnXR6x5d2oV3q8KiKbtVETZ4CSHL2S3BbvbFNMb9ZGhTQA9ap6YfJjT+F+Oc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyHG/SdhQrPE1UGqFbBstfAzKaPXJ8d0I+IjNKduNb6MsjNjlKu
	LYWvHBk1pgVxRtwEx7wnasmbOt0yU1LQW6r9CqflkXIO+LQ89eEKai6dSWt9jNgGAxmd2In4mq8
	6CRc9XHBLrgJ8Vg4=
X-Gm-Gg: Acq92OFOSD1ErWrP+9yb9mh/EQ6q709TCA9ISRkPeTPmKIlKB8bxyPllRzJwMcGJqG3
	PbeDnmNNEZURSn/Gi030000NDQAtTbcX+1RoZfcfOAiQntJd1ksGBUaaVz/IoZBYfvQBnyKQrvV
	XKlGL4ouzc7OvNN+p56mdOcTN4KN0J9DssUIVLrhwAOKvCNpw5vn1PJtEgx82hmJmeGAFGRpGgB
	aQBfjHYU+LNWxHacxU6bNKxUUgNeX6Y8AbN2FyNE5x9MBMoP8kjvtxU1RvO5G2IphzOmAyOMGmu
	c/gWLZMLjaM5AzkUIguLt5/o/WRnvi5EMLY+sN2U4WccvAj+y/r2l9q+UUwyycC4BoITU9yB6Z3
	4Y9HiKqZTth8IhsY9AIGhHWqGMUnzjN0cTWW+F5VpnmsNhQHLe225hDbgHUVOBIJ8kNl+R9p9Mj
	4iP/4VaW4UELkV5Ayk415UkWIDww==
X-Received: by 2002:a05:7301:5781:b0:2ea:5057:a331 with SMTP id 5a478bee46e88-304fa62d359mr5553445eec.21.1780334531925;
        Mon, 01 Jun 2026 10:22:11 -0700 (PDT)
Received: from localhost ([2620:10d:c090:600::a996])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ee0dd8e1sm12610638eec.21.2026.06.01.10.22.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 10:22:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Jun 2026 13:22:09 -0400
Message-Id: <DIXVX3TY4Z2F.1VO3VXXFK7QRJ@etsalapatis.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf v3 1/3] bpf: Add validation for bpf_set_retval
 argument
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Xu Kuohai" <xukuohai@huaweicloud.com>, "Emil Tsalapatis"
 <emil@etsalapatis.com>, <sashiko-reviews@lists.linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260530101239.590395-2-xukuohai@huaweicloud.com>
 <20260530105334.8E8BA1F00893@smtp.kernel.org>
 <DIXH1O3E96VX.EYFDM9QIT6AD@etsalapatis.com>
 <d67ce3b4-ccd4-40e0-993d-9d134e86a058@huaweicloud.com>
In-Reply-To: <d67ce3b4-ccd4-40e0-993d-9d134e86a058@huaweicloud.com>

On Mon Jun 1, 2026 at 9:04 AM EDT, Xu Kuohai wrote:
> On 6/1/2026 1:42 PM, Emil Tsalapatis wrote:
>> On Sat May 30, 2026 at 6:53 AM EDT, sashiko-bot wrote:
>>> Thank you for your contribution! Sashiko AI review found 2 potential is=
sue(s) to consider:
>>> - [High] The strict bounds check added to `bpf_set_retval()` unconditio=
nally rejects programs that pass unconstrained variables, such as the outpu=
t of `bpf_get_retval()`, breaking backward compatibility for existing user =
programs.
>>> - [High] Restricting `bpf_set_retval()` to `[-MAX_ERRNO, 0]` breaks `BP=
F_CGROUP_GETSOCKOPT` programs that legitimately return positive values.
>>> --
>>>
>>> commit 822adc8377df563ad6f9bfabc65c87c7f98aaf52
>>> Author: Xu Kuohai <xukuohai@huawei.com>
>>>
>>> bpf: Add validation for bpf_set_retval argument
>>>
>>> This commit adds validation to the bpf_set_retval helper to prevent
>>> cgroup BPF programs from returning unexpected positive values, which ca=
n
>>> cause wild pointer dereferences or bypass error checks. For BPF_LSM_CGR=
OUP,
>>> it enforces LSM-specific ranges. For other cgroup types, it restricts t=
he
>>> argument to [-MAX_ERRNO, 0].
>>>
>>> Link: https://lore.kernel.org/all/567d3206-74a5-44e5-99c6-779c425f399e@=
std.uestc.edu.cn
>>>
>>>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
>>>> index 7fb88e1cd7c4d..4948bd4bf9e16 100644
>>>> --- a/kernel/bpf/verifier.c
>>>> +++ b/kernel/bpf/verifier.c
>>>> @@ -10460,6 +10460,19 @@ static int check_helper_call(struct bpf_verif=
ier_env *env, struct bpf_insn *insn
>>>>   		}
>>>>   		break;
>>>>   	case BPF_FUNC_set_retval:
>>>> +	{
>>>> +		struct bpf_retval_range range =3D {
>>>> +			.minval =3D -MAX_ERRNO,
>>>> +			.maxval =3D 0,
>>>> +			.return_32bit =3D true
>>>> +		};
>>>
>>> [Severity: High]
>>> Does this blanket restriction to 0 break BPF_CGROUP_GETSOCKOPT programs=
?
>>>
>>> Commit c4dcfdd406aa2167 ("bpf: Move getsockopt retval to struct
>>> bpf_cg_run_ctx") removed the restriction that getsockopt filters must
>>> return <=3D 0, noting that valid getsockopt handlers often return posit=
ive
>>> values for the option length.
>>>
>>> Could this maxval =3D 0 limit prevent BPF_CGROUP_GETSOCKOPT programs fr=
om
>>> legitimately returning positive lengths via bpf_set_retval?
>>>
>>=20
>> AFAICT the getsockopt manpage corroborates the issue, should be possible=
 to
>> account for this.
>>
>
> Yeah, the return value of BPF_CGROUP_GETSOCKOPT is not checked or consume=
d by
> the kernel. It is returned to user directly as the return value of getsoc=
kopt().
> So I think there is no risk to leave it unrestricted.
>
>>>> +		struct bpf_reg_state *r1 =3D &regs[BPF_REG_1];
>>>> +
>>>> +		if (r1->type !=3D SCALAR_VALUE) {
>>>> +			verbose(env, "R1 is not a scalar\n");
>>>> +			return -EINVAL;
>>>> +		}
>>>> +
>>>
>>> [ ... ]
>>>
>>>> @@ -10469,8 +10482,20 @@ static int check_helper_call(struct bpf_verif=
ier_env *env, struct bpf_insn *insn
>>>> +		err =3D mark_chain_precision(env, BPF_REG_1);
>>>> +		if (err)
>>>> +			return err;
>>>> +
>>>> +		if (!retval_range_within(range, r1)) {
>>>> +			verbose_invalid_scalar(env, r1, range, "At bpf_set_retval", "R1");
>>>> +			return -EINVAL;
>>>> +		}
>>>
>>> [Severity: High]
>>> Will this strict bounds check unconditionally reject programs that pass
>>> unconstrained variables, such as the output of bpf_get_retval?
>>>
>>> The helper bpf_get_retval returns an int which is tracked by the verifi=
er
>>> as an unknown scalar. If this unconstrained scalar is passed directly t=
o
>>> bpf_set_retval, it is checked against the newly hardcoded [-MAX_ERRNO, =
0]
>>> range.
>>>
>>> Since the unknown bounds fall outside this narrow range, the verifier w=
ill
>>> reject the program at load time.
>>>
>>> Could this break backward compatibility for existing user programs rely=
ing
>>> on the bpf_set_retval(bpf_get_retval()) pattern?
>>=20
>> "Backward compatibility" is definitely the wrong way to put this
>> considering past behavior was buggy. The only alternative I can see is
>> checking the return value dynamically in the helper itself and returning
>> failure if the attempted value is illegal, and that is an even bigger
>> change in behavior. Programs can add bounds checking to get_retval to
>> handle this.
>
> For cgroup bpf types other than BPF_CGROUP_GETSOCKOPT, the initial retval
> is always set to 0. Since the retval can only be set by bpf_set_retval(),
> and this patch restricts it to range [-MAX_ERRNO, 0], we can conclude tha=
t
> bpf_get_retval() always returns value in the same range for these bpf typ=
es.
>
> So I think it is OK to refine the return value of bpf_get_retval() to ran=
ge
> [-MAX_ERRNO, 0] for non-BPF_CGROUP_GETSOCKOPT types in the verifier.

Sounds good. The above makes sense and the only other way I can think of
we can affect the return value is through bpf_set_retval() which we are
fixing in this patchset.
