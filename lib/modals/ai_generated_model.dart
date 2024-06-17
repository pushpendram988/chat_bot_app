class AIGeneratedModel {
  String? id;
  String? object;
  int? created;
  String? model;
  List<Choices>? choices;
  Usage? usage;
  String? systemFingerprint;

  AIGeneratedModel(
      {this.id,
        this.object,
        this.created,
        this.model,
        this.choices,
        this.usage,
        this.systemFingerprint});

  AIGeneratedModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    created = json['created'];
    model = json['model'];
    if (json['choices'] != null) {
      choices = <Choices>[];
      json['choices'].forEach((v) {
        choices!.add(new Choices.fromJson(v));
      });
    }
    usage = json['usage'] != null ? new Usage.fromJson(json['usage']) : null;
    systemFingerprint = json['system_fingerprint'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['object'] = this.object;
    data['created'] = this.created;
    data['model'] = this.model;
    if (this.choices != null) {
      data['choices'] = this.choices!.map((v) => v.toJson()).toList();
    }
    if (this.usage != null) {
      data['usage'] = this.usage!.toJson();
    }
    data['system_fingerprint'] = this.systemFingerprint;
    return data;
  }
}

class Choices {
  int? index;
  Message? message;
  Null? logprobs;
  String? finishReason;

  Choices({this.index, this.message, this.logprobs, this.finishReason});

  Choices.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    message =
    json['message'] != null ? new Message.fromJson(json['message']) : null;
    logprobs = json['logprobs'];
    finishReason = json['finish_reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['index'] = this.index;
    if (this.message != null) {
      data['message'] = this.message!.toJson();
    }
    data['logprobs'] = this.logprobs;
    data['finish_reason'] = this.finishReason;
    return data;
  }
}

class Message {
  String? role;
  String? content;

  Message({this.role, this.content});

  Message.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['role'] = this.role;
    data['content'] = this.content;
    return data;
  }
}

class Usage {
  int? promptTokens;
  int? completionTokens;
  int? totalTokens;
  Usage({this.promptTokens, this.completionTokens, this.totalTokens});

  Usage.fromJson(Map<String, dynamic> json) {
    promptTokens = json['prompt_tokens'];
    completionTokens = json['completion_tokens'];
    totalTokens = json['total_tokens'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prompt_tokens'] = this.promptTokens;
    data['completion_tokens'] = this.completionTokens;
    data['total_tokens'] = this.totalTokens;
    return data;
  }
}
