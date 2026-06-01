Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4187A23817E
	for <sashiko-reviews@lists.linux.dev>; Mon,  1 Jun 2026 05:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780292573; cv=none; b=S3vdqnclceYj+12hkMu+hjf4qLrQXOyCCq5HEylUAY0XGEbzaCs1aKXhiwFKQq31lc6fzdQpHq3whKCDamETqjYxEax0PTx5Rf0QBXdc9opWLwdRYLl+xYCjuUIz+yfLEffvlIeCRMDmnEWvizRqyh9k5NzYk5sSDB73RS4xva4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780292573; c=relaxed/simple;
	bh=gAGuC7mgz3cTmFY2p5Z4NrMXwl4G6tnbtkwL5iJWcKY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=sXvvrj9UcX9SjyERj0yLg4LBFjE7DJd+I4y2KqGuJbJPPH4/y0hDr40mqvnJzIJhy85EKOfPqBoelOJ034AKPwJ0N5nYxj1WBSIAw0CbXYtEVHWJVpAj5M3LOsCoLGPO5A45+C4CctBQ6fJiVHliGvHVrTwf3T8MqPzpWxPi7ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=Wvbis8BO; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="Wvbis8BO"
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-36d8b644473so1044221a91.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 31 May 2026 22:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1780292571; x=1780897371; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sHvGYuplz5QC4FAZEE77//dWf1JalWwiXwaCA2SHLeA=;
        b=Wvbis8BOkivxT6lk3sRk+KEqjSC0aCKfe7DBKxdc6j17kEzQhVS7cXDN8QyYuGJpp9
         C3TsvVdyaxjm1sVOyADElgXu/3N8EYmowEL9Y/H6cItve5ffmvxan8y/9qtr9Fhu5dFZ
         nsv7L0k0ZLN3BBVCQXGjYxGjnAo4uynzxjqd0DYTESj77b7qCsQ0iEWkcWA3IZ9Wczkl
         Bz1SSytF8GxPNGtxHswRXT+acqYwhV6U5SK17jyrjfv8b4mt4XvnYTFnY2x+tfGpz7SC
         TuKrUU76ciij25k0V75rKgikR+VJWxX+6TLtc3QBCxY71jo7xbiS/+9+ADFA0t8bvOCK
         1zrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780292571; x=1780897371;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sHvGYuplz5QC4FAZEE77//dWf1JalWwiXwaCA2SHLeA=;
        b=UgBG0TZ6JdcXGEfgpPF0c+nAF4gdQ+i9SjQhI+dP33kJzC8z8AAzkIKKUmRIOUEOue
         GIzmWP3a5U41I1t/S/6WEcJSSLcA21MwyiqjP+2XerdWfmowj5/nSKTQFovFBzZW5DJf
         1VdM6+2qvvDCkc+p69I1OC1lODKTmc08siKuXEoDoZC2bFEvY/99Sb/IQsDZUlR3+EA7
         ECbnF4jFSe69cxEwAjwb495xqExn5cNgv2tE/jj9SM5Dg/rL1tejziZe9Vf3BX01vMFw
         Lac//NW/ic1rRYZnGcH+jN++XLUIc7/ujGJaqRY6BzE31GB0chZebGnoMjw0VcM79Y60
         oIVg==
X-Gm-Message-State: AOJu0YzbDEggwe/hICDs+SzyuVmxFA5oy1R6YTmGrK5827n3RwCP5Pbm
	Kf/o5A0TpjPvJZeVQ32zw4hVqH11ZCnkS9oTUQPLG/fh5hOWGfGQTuNwmb1DBQDkPqQCMKkath8
	ZRyKd2gNAI3pR
X-Gm-Gg: Acq92OGFB+sTlUPEpjg9z7kFnlVuUw6954hlOpljPMM77wDQGVOPc98ZR/L22m8aDD/
	zExozpYGMumHfBvrKFCIyfEGCKeMAsak0AbCOEHb53whUFjy32Q4R+M8bylzQLjrmrhXfSspu5s
	9P54EaugOdEeybUFG9nt3VKrud5RGZ0ZsuU+z6kk+qy/4C2FAovfMy/WyRvLe4DG7azcJPRncYR
	EK2l7s/4ZLYRimoJRIWjO9qdG6PavisUREaLg53F9AaCN4KDm+iMV+szAyXFeY6jSFLv+8S1+/h
	p77q8N8DU0dU4r33hSnHJd6/ztxeBvmCbhstrGK/WvyN/vJ1B45TIapLe8mXqO4cOq70pF33TZm
	p6y0fWDqsDdon50ahf4iR2kfQjw+g/E1wpa/oRc4gm9XJiHlDA48OsvpGmHmhhj3GCMndsWxdBy
	o6PMzUKkxunsv1QlMz8YUyrV6x98B97Q6Oyak=
X-Received: by 2002:a17:90a:d604:b0:369:69f8:ad6b with SMTP id 98e67ed59e1d1-36c2eb88bd7mr8758527a91.0.1780292571400;
        Sun, 31 May 2026 22:42:51 -0700 (PDT)
Received: from localhost ([2001:569:58a0:da00:a5c8:c4ce:f7c1:40c1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc0c1ab21sm9430416a91.14.2026.05.31.22.42.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 22:42:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Jun 2026 01:42:50 -0400
Message-Id: <DIXH1O3E96VX.EYFDM9QIT6AD@etsalapatis.com>
Cc: <bpf@vger.kernel.org>
Subject: Re: [PATCH bpf v3 1/3] bpf: Add validation for bpf_set_retval
 argument
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: <sashiko-reviews@lists.linux.dev>, "Xu Kuohai"
 <xukuohai@huaweicloud.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260530101239.590395-2-xukuohai@huaweicloud.com>
 <20260530105334.8E8BA1F00893@smtp.kernel.org>
In-Reply-To: <20260530105334.8E8BA1F00893@smtp.kernel.org>

On Sat May 30, 2026 at 6:53 AM EDT, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] The strict bounds check added to `bpf_set_retval()` unconditiona=
lly rejects programs that pass unconstrained variables, such as the output =
of `bpf_get_retval()`, breaking backward compatibility for existing user pr=
ograms.
> - [High] Restricting `bpf_set_retval()` to `[-MAX_ERRNO, 0]` breaks `BPF_=
CGROUP_GETSOCKOPT` programs that legitimately return positive values.
> --
>
> commit 822adc8377df563ad6f9bfabc65c87c7f98aaf52
> Author: Xu Kuohai <xukuohai@huawei.com>
>
> bpf: Add validation for bpf_set_retval argument
>
> This commit adds validation to the bpf_set_retval helper to prevent
> cgroup BPF programs from returning unexpected positive values, which can
> cause wild pointer dereferences or bypass error checks. For BPF_LSM_CGROU=
P,
> it enforces LSM-specific ranges. For other cgroup types, it restricts the
> argument to [-MAX_ERRNO, 0].
>
> Link: https://lore.kernel.org/all/567d3206-74a5-44e5-99c6-779c425f399e@st=
d.uestc.edu.cn
>
>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
>> index 7fb88e1cd7c4d..4948bd4bf9e16 100644
>> --- a/kernel/bpf/verifier.c
>> +++ b/kernel/bpf/verifier.c
>> @@ -10460,6 +10460,19 @@ static int check_helper_call(struct bpf_verifie=
r_env *env, struct bpf_insn *insn
>>  		}
>>  		break;
>>  	case BPF_FUNC_set_retval:
>> +	{
>> +		struct bpf_retval_range range =3D {
>> +			.minval =3D -MAX_ERRNO,
>> +			.maxval =3D 0,
>> +			.return_32bit =3D true
>> +		};
>
> [Severity: High]
> Does this blanket restriction to 0 break BPF_CGROUP_GETSOCKOPT programs?
>
> Commit c4dcfdd406aa2167 ("bpf: Move getsockopt retval to struct
> bpf_cg_run_ctx") removed the restriction that getsockopt filters must
> return <=3D 0, noting that valid getsockopt handlers often return positiv=
e
> values for the option length.=20
>
> Could this maxval =3D 0 limit prevent BPF_CGROUP_GETSOCKOPT programs from=
=20
> legitimately returning positive lengths via bpf_set_retval?
>

AFAICT the getsockopt manpage corroborates the issue, should be possible to
account for this.

>> +		struct bpf_reg_state *r1 =3D &regs[BPF_REG_1];
>> +
>> +		if (r1->type !=3D SCALAR_VALUE) {
>> +			verbose(env, "R1 is not a scalar\n");
>> +			return -EINVAL;
>> +		}
>> +
>
> [ ... ]
>
>> @@ -10469,8 +10482,20 @@ static int check_helper_call(struct bpf_verifie=
r_env *env, struct bpf_insn *insn
>> +		err =3D mark_chain_precision(env, BPF_REG_1);
>> +		if (err)
>> +			return err;
>> +
>> +		if (!retval_range_within(range, r1)) {
>> +			verbose_invalid_scalar(env, r1, range, "At bpf_set_retval", "R1");
>> +			return -EINVAL;
>> +		}
>
> [Severity: High]
> Will this strict bounds check unconditionally reject programs that pass=
=20
> unconstrained variables, such as the output of bpf_get_retval?
>
> The helper bpf_get_retval returns an int which is tracked by the verifier=
=20
> as an unknown scalar. If this unconstrained scalar is passed directly to=
=20
> bpf_set_retval, it is checked against the newly hardcoded [-MAX_ERRNO, 0]=
=20
> range.=20
>
> Since the unknown bounds fall outside this narrow range, the verifier wil=
l=20
> reject the program at load time.=20
>
> Could this break backward compatibility for existing user programs relyin=
g=20
> on the bpf_set_retval(bpf_get_retval()) pattern?

"Backward compatibility" is definitely the wrong way to put this
considering past behavior was buggy. The only alternative I can see is
checking the return value dynamically in the helper itself and returning
failure if the attempted value is illegal, and that is an even bigger
change in behavior. Programs can add bounds checking to get_retval to
handle this.
